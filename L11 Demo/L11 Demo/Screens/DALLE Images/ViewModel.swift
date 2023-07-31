//
//  ViewModel.swift
//  L11 Demo
//
//  Created by Tianbo Qiu on 7/30/23.
//

import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    
    @Published var prompt = ""
    
    @Published var urls: [URL] = []
    
    @Published var dallEImages: [DalleImage] = []
    
    @Published var fetching = false
    
    @Published var selectedImage: UIImage?
    
    @Published var imageStyle: ImageStyle = .none
    
    @Published var imageMedium: ImageMedium = .none
    
    @Published var artist: Artist = .none
    
    @Published var showAlert: Bool = false
    
    var description: String {
        let characteristics = imageStyle.description + imageMedium.description + artist.description
        
        return prompt + (!characteristics.isEmpty ? "\n- " + characteristics : "")
    }
    
    let apiService = APIService()
    
    func clearImages() {
        urls = []
        dallEImages.removeAll()
        
        for _ in 1...Constants.n {
            dallEImages.append(DalleImage())
        }
        
        selectedImage = nil
    }
    
    func reset() {
        clearImages()
        imageStyle = .none
        imageMedium = .none
        artist = .none
    }
    
    func fetchImages() {
        clearImages()
        
        withAnimation {
            fetching.toggle()
        }
        
        let input = GenerationInput(prompt: description)
        
        Task {
            if let data = input.encodedData {
                do {
                    let response = try await apiService.fetchImages(with: data)
                    
                    for data in response.data {
                        urls.append(data.url)
                    }
                    
                    withAnimation {
                        fetching.toggle()
                    }
                    
                    for (index, url) in urls.enumerated() {
                        dallEImages[index].uiImage = await apiService.loadImage(at: url)
                    }
                } catch {
                    print(error)
                    fetching.toggle()
                    showAlert.toggle()
                }
            }
        }
    }
    
    func fetchVariations() {
        if let selectedImage {
            fetching.toggle()
            guard let imageData = selectedImage.pngData() else {
                return
            }
            
            clearImages()
            
            Task {
                do {
                    let formdataFields: [String: Any] = ["n": Constants.n,
                                                         "size": Constants.imageSize]
                    
                    let response = try await apiService.getVariations(formDataField: formdataFields,
                                                                      fieldName: "image",
                                                                      fileName: "can be any string",
                                                                      fileData: imageData)
                    
                    for data in response.data {
                        urls.append(data.url)
                    }
                    
                    withAnimation {
                        fetching.toggle()
                    }
                    
                    for (index, url) in urls.enumerated() {
                        dallEImages[index].uiImage = await apiService.loadImage(at: url)
                    }
                } catch {
                    print(error)
                    fetching.toggle()
                }
            }
        }
    }
}

//
//  ContentView.swift
//  L11 Demo
//
//  Created by Tianbo Qiu on 7/30/23.
//

import SwiftUI

struct DALLEImagesView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                if !viewModel.urls.isEmpty {
                    ViewThatFits {
                        PreviewImage(viewModel: viewModel)
                            .padding()
                        
                        ScrollView(.horizontal) {
                            PreviewImage(viewModel: viewModel)
                                .padding()
                        }
                    }
                }
                
                if !viewModel.fetching {
                    
                    if !viewModel.urls.isEmpty {
                        Text("Select an image")
                    }
                    
                    if let selectedImage = viewModel.selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 256, height: 256)
                    }
                    
                    if viewModel.urls.isEmpty {
                        Text("The more descriptive you can be, the better")
                        TextField("Image Description...",
                                  text: $viewModel.prompt,
                                  axis: .vertical)
                        .showClearButton($viewModel.prompt)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        
                        Form {
                            Picker("Style", selection: $viewModel.imageStyle) {
                                ForEach(ImageStyle.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            Picker("Image Medium", selection: $viewModel.imageMedium) {
                                ForEach(ImageMedium.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            Picker("Artist", selection: $viewModel.artist) {
                                ForEach(Artist.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            
                            HStack {
                                Spacer()
                                Button("Fetch") {
                                    viewModel.fetchImages()
                                }
                                .disabled(viewModel.prompt.isEmpty)
                                .buttonStyle(.borderedProminent)
                            }
                            
                            HStack {
                                Spacer()
                                if viewModel.urls.isEmpty || viewModel.selectedImage == nil {
                                    Image("coffee")
                                        .resizable()
                                        .scaledToFit()
                                }
                                Spacer()
                            }
                        }
                    } else {
                        
                        Text(viewModel.description)
                            .padding()
                        
                        HStack {
                            if viewModel.selectedImage != nil {
                                Button("Get Variation") {
                                    viewModel.fetchVariations()
                                }
                            }
                            
                            Button("Try another") {
                                viewModel.reset()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                } else {
                    Spacer()
                    FetchingView()
                    Spacer()
                }
                if viewModel.selectedImage == nil && !viewModel.urls.isEmpty {
                    Image("coffee")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
            }
            .navigationTitle("Image Generation")
            .edgesIgnoringSafeArea(.bottom)
            .toolbar {
                if let selectedImage = viewModel.selectedImage {
                    ToolbarItem {
                        ShareLink(item: Image(uiImage: selectedImage),
                                  subject: Text("Generated Image"),
                                  message: Text(viewModel.description),
                                  preview: SharePreview(Text("Generated Image"), image: Image(uiImage: selectedImage)))
                    }
                }
            }
            .alert("Processing Error", isPresented: $viewModel.showAlert) {
                Button("OK") {}
            } message: {
                Text("Unable to process this request. Your image description cannot be interpreted.")
            }
        }
    }
}

struct PreviewImage: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @Environment(\.horizontalSizeClass) var hcc
     
    var body: some View {
                    HStack {
                        ForEach(viewModel.dallEImages) { image in
                            if let uiImage = image.uiImage {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(
                                        width: hcc == .compact ? 80 : 120,
                                        height: hcc == .compact ? 80 : 120)
                                    .onTapGesture {
                                        viewModel.selectedImage = uiImage
                                    }
                            } else {
                                ProgressView()
                                    .frame(
                                        width: hcc == .compact ? 80 : 120,
                                        height: hcc == .compact ? 80 : 120)
                            }
                        }
                    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DALLEImagesView()
    }
}

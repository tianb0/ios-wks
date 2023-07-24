//
//  ContentView.swift
//  L8 Demo
//
//  Created by Tianbo Qiu on 7/22/23.
//

import SwiftUI

struct CityView: View {
    
    @State var cities = [City]()
    
    var dataService = DataService()
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(cities) { city in
                        NavigationLink {
                            AttractionView(city: city)
                        } label: {
                            CityCard(city: city)
                                .padding(.bottom, 20)
                        }

                    }
                }
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea() // can interfere with vertical padding
        .onAppear {
//            cities = dataService.getData()
            cities = dataService.getFileData()
        }
    }
}

struct City_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}

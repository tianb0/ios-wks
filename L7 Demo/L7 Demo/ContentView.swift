//
//  ContentView.swift
//  L7 Demo
//
//  Created by Tianbo Qiu on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    
    var photos = [
        "gallery1",
        "gallery2",
        "gallery3",
        "gallery4",
        "gallery5",
        "gallery6",
        "gallery7",
        "gallery8",
        "gallery9",
        "gallery10",
        "gallery11"
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(
                columns: [GridItem(spacing: 0), GridItem(spacing: 0), GridItem(spacing: 0)],
                spacing: 0
            ) {
                ForEach (photos, id: \.self) { photo in
                    Image(photo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  L10 Demo
//
//  Created by Tianbo Qiu on 7/29/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            PickEnum()
                .tabItem {
                    Image(systemName: "eraser.fill")
                    Text("Enum")
                }
            
            PickIndex()
                .tabItem {
                    Image(systemName: "pencil.line")
                    Text("Index")
                }
            
            InputView()
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("TextView")
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("ListView")
                }
            
            SectionList()
                .tabItem {
                    Image(systemName: "aspectratio.fill")
                    Text("SectionList")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

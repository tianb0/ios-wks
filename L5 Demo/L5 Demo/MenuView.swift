//
//  ContentView.swift
//  L5 Demo
//
//  Created by Tianbo Qiu on 7/18/23.
//

import SwiftUI

struct MenuView: View {
    
    @State var menuItems = [MenuItem]()
    
    var dataService = DataService()
    
    var body: some View {
        
        List(menuItems) { item in
            MenuListRow(item: item)
        }
        .listStyle(.plain)
        .onAppear {
            menuItems = dataService.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

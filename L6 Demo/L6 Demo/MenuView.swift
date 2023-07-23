//
//  MenuView.swift
//  L6 Demo
//
//  Created by Tianbo Qiu on 7/19/23.
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

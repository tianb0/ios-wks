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
            HStack {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .cornerRadius(10)
                
                Text(item.name)
                    .bold()
                
                Spacer()
                
                Text("$" + item.price)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color(.brown).opacity(0.1))
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

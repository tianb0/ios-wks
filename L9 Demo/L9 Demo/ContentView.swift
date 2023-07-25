//
//  ContentView.swift
//  L9 Demo
//
//  Created by Tianbo Qiu on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var userInput: String = "blue"
    
    var body: some View {
        VStack {
            
            ZStack {
                Rectangle()
                    .foregroundColor(
                        userInput.lowercased() == "blue" ? .blue : .mint
                    )
                
                AccountView()
                    .foregroundColor(.white)
                    .environmentObject(Profile())
                
            }
            
            ControlPanel(userInput: $userInput)
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

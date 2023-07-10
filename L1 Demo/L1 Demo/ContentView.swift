//
//  ContentView.swift
//  L1 Demo
//
//  Created by Tianbo Qiu on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            // background color
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                Image("niagarafalls")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                Text("Niagrafa Falls")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

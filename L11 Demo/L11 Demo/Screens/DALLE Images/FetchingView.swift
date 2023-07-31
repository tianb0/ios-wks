//
//  FetchingView.swift
//  L11 Demo
//
//  Created by Tianbo Qiu on 7/30/23.
//

import SwiftUI

struct FetchingView: View {
    
    @State private var rotation = 0.0
    
    var body: some View {
        ZStack {
            Image("coffee")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .clipShape(Circle())
            Text("⭐️").font(.system(size: 70))
                .offset(x: -185)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear
                    .speed(0.2)
                    .repeatForever(autoreverses: false), value: rotation)
        }
        .onAppear {
            rotation = 360
        }
    }
}

struct FetchingView_Previews: PreviewProvider {
    static var previews: some View {
        FetchingView()
    }
}

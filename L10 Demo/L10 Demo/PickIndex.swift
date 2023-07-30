//
//  PickIndex.swift
//  L10 Demo
//
//  Created by Tianbo Qiu on 7/29/23.
//

import SwiftUI

struct PickIndex: View {
    
    var colors = ["red", "blue", "yellow"]
    
    @State private var idx = 0
    
    var body: some View {
        VStack {
            
            Text("\(colors[idx]) selected")
            
            Picker(selection: $idx) {
                ForEach(0..<colors.count, id: \.self) {
                    Text(colors[$0])
                }
            } label: {
                Text("Colors")
            }
            .pickerStyle(WheelPickerStyle())

        }
    }
}

struct PickIndex_Previews: PreviewProvider {
    static var previews: some View {
        PickIndex()
    }
}

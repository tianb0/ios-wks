//
//  InputView.swift
//  L10 Demo
//
//  Created by Tianbo Qiu on 7/29/23.
//

import SwiftUI

struct InputView: View {
    
    @State var textInput = ""
    
    @State var numInput = 0
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("value: \(textInput)")
                
                TextField("name",
                          text: $textInput,
                          onEditingChanged: { focus in
                    print("focused \(focus)")
                },
                          onCommit: {
                    print("submitted")
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack {
                Text("number is \(numInput)")
                
                TextField(
                    "number",
                    value: $numInput,
                    formatter: NumberFormatter()
                )
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
        }.padding()
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}

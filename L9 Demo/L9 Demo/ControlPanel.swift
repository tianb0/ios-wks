//
//  ControlPanel.swift
//  L9 Demo
//
//  Created by Tianbo Qiu on 7/24/23.
//

import SwiftUI

struct ControlPanel: View {
    
    @Binding var userInput: String
    
    var body: some View {
        TextField("", text: $userInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct ControlPanel_Previews: PreviewProvider {
    static var previews: some View {
        ControlPanel(userInput: Binding.constant("blue"))
    }
}

//
//  SectionList.swift
//  L10 Demo
//
//  Created by Tianbo Qiu on 7/30/23.
//

import SwiftUI

struct SectionList: View {
    var body: some View {
        
        List {
            ForEach(0..<3) {
                Section("Section \($0)") {
                    ForEach(0..<5) {
                        Text("Item \($0)")
                    }
                }
            }
        }
    }
}

struct SectionList_Previews: PreviewProvider {
    static var previews: some View {
        SectionList()
    }
}

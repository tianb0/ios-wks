//
//  PickEnum.swift
//  L10 Demo
//
//  Created by Tianbo Qiu on 7/29/23.
//

import SwiftUI

enum Language: String, CaseIterable, Identifiable {
    case swift, rust, ruby
    var id: Self { self }
}

struct PickEnum: View {
    
    @State private var selected = Language.swift
    
    var body: some View {
        
        List {
            Text("\(selected.rawValue.uppercased())")
            
            Picker("Language", selection: $selected) {
                ForEach(Language.allCases) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
        }
    }
}

struct PickEnum_Previews: PreviewProvider {
    static var previews: some View {
        PickEnum()
    }
}

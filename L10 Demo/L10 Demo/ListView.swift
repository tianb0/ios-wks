//
//  ListView.swift
//  L10 Demo
//
//  Created by Tianbo Qiu on 7/30/23.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            ForEach(0..<10) {
                Text(String($0))
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            print("edit")
                        } label: {
                            Image(systemName: "pencil")
                        }
                        .tint(.blue)
                        
                        Button {
                            print("heart")
                        } label: {
                            Image(systemName: "heart")
                        }
                        .tint(.yellow)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        
                        Button {
                            print("delete")
                        } label: {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                        
                    }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

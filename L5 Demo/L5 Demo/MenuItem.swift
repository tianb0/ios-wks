//
//  MenuItem.swift
//  L5 Demo
//
//  Created by Tianbo Qiu on 7/18/23.
//

import Foundation

struct MenuItem: Identifiable {
    var id = UUID() // conform to Identifiable
    var name: String
    var price: String
    var imageName: String
}

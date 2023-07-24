//
//  City.swift
//  L8 Demo
//
//  Created by Tianbo Qiu on 7/22/23.
//

import Foundation

struct City: Identifiable, Decodable {
    
    let id = UUID()
    var name: String
    var summary: String
    var imageName: String
    
    var attractions: [Attraction]
}

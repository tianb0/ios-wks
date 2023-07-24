//
//  Attraction.swift
//  L8 Demo
//
//  Created by Tianbo Qiu on 7/22/23.
//

import Foundation

struct Attraction: Identifiable, Decodable {
    
    let id = UUID()
    var name: String
    var summary: String
    var longDescription: String
    var imageName: String
    var latLong: String
}

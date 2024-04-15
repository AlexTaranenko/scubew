//
//  LocationModel.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation

struct LocationModel: Codable {
    
    let id: String?
    let title: String?
    let street: String?
    let distance: Double?
    
    init(title: String? = nil, street: String? = nil, distance: Double? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.street = street
        self.distance = distance
    }
}

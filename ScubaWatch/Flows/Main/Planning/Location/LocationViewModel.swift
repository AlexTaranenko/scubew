//
//  LocationViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation

class LocationViewModel {
    
    var searchText: String?
    private var locations: [LocationModel]
    
    init() {
        self.searchText = nil
        self.locations = [
            LocationModel(title: "Shark Fin Rock", street: "Lanai’i (Hawaii)", distance: 1550),
            LocationModel(title: "Bajo Alcyone", street: "Cocos Island (Costa Rica)", distance: 2436),
            LocationModel(title: "Blue Corner", street: "Ngemelis Island (Palau)", distance: 5888)
        ]
    }
    
    var filteredLocations: [LocationModel] {
        guard String.checkField(searchText) else {
            return locations
        }
        return locations.filter({($0.title ?? "").localizedStandardContains(searchText ?? "")})
    }
}

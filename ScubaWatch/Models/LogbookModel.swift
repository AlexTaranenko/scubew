//
//  LogbookModel.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation

struct LogbookModel: Codable {
    
    let id: String?
    let title: String?
    let street: String?
    let date: String?
    var typeOfDive: [TypeOfDive]
    
    init(title: String? = nil, street: String? = nil, date: String? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.street = street
        self.date = date
        self.typeOfDive = []
    }
}

//
//  AppStorage.swift
//  Telepromter
//
//  Created by Alex on 26.04.2023.
//

import Foundation

struct AppStorage {
    
    static var instance: AppStorage = .init()
    
    init() {}
  
    @DefaultsStorage(key: "confirmedBirthday", defaultValue: false)
    var confirmedBirthday: Bool
    
    @DefaultsStorage(key: "isLoggedIn", defaultValue: false)
    var isLoggedIn: Bool

    @DefaultsStorage(key: "step", defaultValue: 0)
    var step: Int
}

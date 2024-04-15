//
//  SettingsFactory.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation

class SettingsFactory: Factory {
    
    func createSettingsScreen() -> SettingsViewController {
        return SettingsViewController.instantiate()
    }
}

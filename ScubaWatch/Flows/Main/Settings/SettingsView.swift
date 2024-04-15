//
//  SettingsView.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation

protocol SettingsView {
    var onShowScreen: ((SettingsArrow) -> Void)? { get set }
    var onLogout: (() -> Void)? { get set }
}

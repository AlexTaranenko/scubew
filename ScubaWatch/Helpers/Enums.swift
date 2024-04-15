//
//  Enums.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import Foundation
import UIKit

// MARK: - Storyboard
enum Storyboard: String {
    case loading = "Loading"
    case confirming = "Confirming"
    case terms = "Terms"
    case signUp = "SignUp"
    case signUpEmail = "SignUpEmail"
    case confirmEmail = "ConfirmEmail"
    case home = "Home"
    case logbook = "Logbook"
    case planning = "Planning"
    case settings = "Settings"
    case account = "Account"
    case login = "Login"
    case onboarding = "Onboarding"
    case sensor = "Sensor"
    case noDeco = "NoDeco"
    case location = "Location"
    case locationDetail = "LocationDetail"
    case logbookDetail = "LogbookDetail"
    case typeOfDive = "TypeOfDive"
}

// MARK: - LoadingScreen
enum LoadingScreen {
    case idle
    case confirming
    case signUp
    case home
}

// MARK: - ConfirmingRow
enum ConfirmingRow: String, CaseIterable, Equatable {
    case data = "data"
    case terms = "terms_of_use"
    
    var description: String {
        switch self {
        case .data:
            return "data_description".localized
        case .terms:
            return "terms_description".localized
        }
    }
}

// MARK: - TextLink
enum TextLink: String {
    case privacyLaw = "privacy_law"
    case terms = "terms_of_use_agreement"
    
    var link: String {
        switch self {
        case .privacyLaw:
            return "https://www.google.com.ua"
        case .terms:
            return "https://www.apple.com"
        }
    }
}

enum TabBarItem: Int, CaseIterable {
    case home = 0, logbook, planning, settings
    
    var icon: UIImage? {
        switch self {
        case .home: return Asset.Images.homeIcon.image
        case .logbook: return Asset.Images.logbookIcon.image
        case .planning: return Asset.Images.planningIcon.image
        case .settings: return Asset.Images.settingsIcon.image
        }
    }
    
    var title: String {
        switch self {
        case .home: return "home".localized
        case .logbook: return "logbook".localized
        case .planning: return "planning".localized
        case .settings: return "settings".localized
        }
    }
}

// MARK: - PhotoPicker
enum PhotoPicker {
    case take
    case gallery
    
    var title: String {
        switch self {
        case .take: return "take_a_photo".localized
        case .gallery: return "gallery".localized
        }
    }
}

enum SettingsArrow: Int, CaseIterable {
    case account = 0, terms, data
    
    var title: String {
        switch self {
        case .account: return "account".localized
        case .terms: return "terms_of_use".localized
        case .data: return "data".localized
        }
    }
}

enum OnboardingRow: Int, CaseIterable, Equatable {
    case account = 0, sensor, sync
    
    var title: String {
        switch self {
        case .account: return "step_account".localized
        case .sensor: return "step_sensor".localized
        case .sync: return "step_sync".localized
        }
    }
}

enum OnboardingSensor: Int, Equatable {
    case gps = 0, health, sync
    
    var values: (String, String) {
        switch self {
        case.gps: return ("gps".localized, "gps_desc".localized)
        case.health: return ("health".localized, "health_desc".localized)
        case.sync: return ("searching...".localized, "searching_desc".localized)
        }
    }
}

enum PlanningRow: Int, CaseIterable {
    case noDeco = 0, location
    
    var title: String {
        switch self {
        case .noDeco: return "no_deco_planner".localized
        case .location: return "location_planner".localized
        }
    }
}

enum NoDecoSegmentRow: Int, CaseIterable {
    case air = 0, nitrox
    
    var title: String {
        switch self {
        case .air: return "air".localized
        case .nitrox: return "nitrox".localized
        }
    }
}

enum ChartType: Int, CaseIterable {
    case depth = 0, temp, ascent, noDeco
    
    var title: String {
        switch self {
        case .depth: return "depth".localized
        case .temp: return "temp".localized
        case .ascent: return "ascent".localized
        case .noDeco: return "no_deco".localized
        }
    }
}

enum TankType: Int, CaseIterable {
    case steel = 0, aluminium
    
    var title: String {
        switch self {
        case .steel: return "steel".localized
        case .aluminium: return "aluminium".localized
        }
    }
}

enum TankVolume: Int, CaseIterable {
    case L_10 = 0, L_12, L_15
    
    var title: String {
        switch self {
        case .L_10: return "l".localized([10])
        case .L_12: return "l".localized([12])
        case .L_15: return "l".localized([15])
        }
    }
}

enum WaterConditionsRow: Int, CaseIterable {
    case visibility = 0, surface, current
    
    var title: String {
        switch self {
        case .visibility: return "visibility".localized
        case .surface: return "surface_condition".localized
        case .current: return "current".localized
        }
    }
}

enum TypeOfDive: Int, CaseIterable, Codable {
    case cave = 0, drift, freshWater, ice, night, wall, wreck
    
    var title: String {
        switch self {
        case .cave: return "cave".localized
        case .drift: return "drift".localized
        case .freshWater: return "fresh_water".localized
        case .ice: return "ice".localized
        case .night: return "night".localized
        case .wall: return "wall".localized
        case .wreck: return "wreck".localized
        }
    }
}

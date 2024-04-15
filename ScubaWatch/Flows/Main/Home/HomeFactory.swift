//
//  HomeFactory.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation

class HomeFactory: Factory {
    
    func createHomeScreen() -> HomeViewController {
        let homeVC = HomeViewController.instantiate()
        return homeVC
    }
    
    func createOnboardingScreen() -> OnboardingViewController {
        return OnboardingViewController.instantiate()
    }
    
    func createSensorScreen(_ onboardingSensor: OnboardingSensor) -> SensorViewController {
        let sensorVC = SensorViewController.instantiate()
        sensorVC.viewModel = SensorViewModel(onboardingSensor)
        return sensorVC
    }
}

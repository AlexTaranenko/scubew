//
//  PlanningFactory.swift
//  ScubaWatch
//
//  Created by Alex on 07.07.2023.
//

import Foundation

class PlanningFactory: Factory {
    
    func createPlanningScreen() -> PlanningViewController {
        return PlanningViewController.instantiate()
    }
    
    func createNoDecoScreen() -> NoDecoViewController {
        return NoDecoViewController.instantiate()
    }
    
    func createLocationScreen() -> LocationViewController {
        return LocationViewController.instantiate()
    }
    
    func createLocationDetailScreen(_ model: LocationModel) -> LocationDetailViewController {
        let locationDetailVC = LocationDetailViewController.instantiate()
        locationDetailVC.model = model
        return locationDetailVC
    }
}

//
//  PlanningCoordinator.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class PlanningCoordinator: Coordinator {
    var presenter: UINavigationController = UINavigationController()
    let factory: PlanningFactory
    
    init() {
        self.factory = PlanningFactory()
    }
    
    func start() {
        showPlanningScreen()
        presenter.tabBarItem = UITabBarItem(title: TabBarItem.planning.title,
                                            image: TabBarItem.planning.icon,
                                            tag: TabBarItem.planning.rawValue)
    }
    
    private func showPlanningScreen() {
        let vc = factory.createPlanningScreen()
        vc.onShowPlanner = { [weak self] planningRow in
            switch planningRow {
            case .noDeco:
                self?.showNoDecoScreen()
            case .location:
                self?.showLocationScreen()
            }
        }
        presenter.setViewControllers([vc], animated: false)
    }
    
    private func showNoDecoScreen() {
        let vc = factory.createNoDecoScreen()
        presenter.pushViewController(vc, animated: true)
    }
    
    private func showLocationScreen() {
        let vc = factory.createLocationScreen()
        vc.onShowLocationDetail = { [weak self] model in
            self?.showLocationDetailScreen(model)
        }
        presenter.pushViewController(vc, animated: true)
    }
    
    private func showLocationDetailScreen(_ model: LocationModel) {
        let vc = factory.createLocationDetailScreen(model)
        presenter.pushViewController(vc, animated: true)
    }
}

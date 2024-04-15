//
//  HomeCoordinator.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class HomeCoordinator: Coordinator {
    var presenter: UINavigationController = UINavigationController()
    private let factory: HomeFactory
    
    init() {
        self.factory = HomeFactory()
    }
    
    func start() {
        showHomeScreen()
        presenter.tabBarItem = UITabBarItem(title: TabBarItem.home.title,
                                            image: TabBarItem.home.icon,
                                            tag: TabBarItem.home.rawValue)
    }
    
    private func showHomeScreen() {
        let vc = factory.createHomeScreen()
        vc.onShowAccount = { [weak self] in
            self?.showAccountScreen()
        }
        vc.onShowOnboarding = { [weak self] in
            self?.showOnboardingScreen()
        }
        presenter.setViewControllers([vc], animated: false)
    }
    
    private func showAccountScreen() {
        let vc = factory.createAccountScreen(UserModel())
        presenter.pushViewController(vc, animated: true)
    }
    
    private func showOnboardingScreen() {
        let vc = factory.createOnboardingScreen()
        vc.onShowAccount = { [weak self] in
            self?.showAccountScreen()
        }
        vc.onShowSynchronize = { [weak self] onboardingSensor in
            self?.showSensorScreen(onboardingSensor)
        }
        vc.onFinish = { [weak self] in
            
        }
        presenter.pushViewController(vc, animated: true)
    }
    
    private func showSensorScreen(_ onboardingSensor: OnboardingSensor) {
        let vc = factory.createSensorScreen(onboardingSensor)
        vc.onShowNextSensor = { [weak self] sensor in
            self?.showSensorScreen(sensor)
        }
        vc.onFinish = { [weak self] in
            self?.presenter.popViewController(animated: true)
        }
        presenter.pushViewController(vc, animated: true)
    }
}

//
//  SettingsCoordinator.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

class SettingsCoordinator: Coordinator {
    var presenter: UINavigationController = UINavigationController()
    let factory: SettingsFactory
    
    init() {
        self.factory = SettingsFactory()
    }
    
    func start() {
        showSettingsScreen()
        presenter.tabBarItem = UITabBarItem(title: TabBarItem.settings.title,
                                            image: TabBarItem.settings.icon,
                                            tag: TabBarItem.settings.rawValue)
    }
    
    private func showSettingsScreen() {
        let vc = factory.createSettingsScreen()
        vc.onShowScreen = { [weak self] settingsRow in
            switch settingsRow {
            case .account:
                self?.showAccountScreen()
            case .terms:
                self?.showTermsScreen(.terms)
            case .data:
                self?.showTermsScreen(.data)
            }
        }
        vc.onLogout = { [weak self] in
            self?.showStartScreen()
        }
        presenter.setViewControllers([vc], animated: false)
    }
    
    private func showAccountScreen() {
        let vc = factory.createAccountScreen(UserModel())
        presenter.pushViewController(vc, animated: true)
    }
    
    private func showTermsScreen(_ confirmingRow: ConfirmingRow) {
        let vc = factory.createTermsScreen(confirmingRow)
        presenter.present(vc, animated: true)
    }
    
    private func showStartScreen() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        sceneDelegate.applicationCoordinator?.showSignUpScreen()
    }
}

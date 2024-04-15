//
//  ApplicationCoordinator.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    var presenter: UINavigationController = UINavigationController()
    private let window: UIWindow?
    private let factory: ApplicationFactory
    
    // MARK: - Init
    init(window: UIWindow?) {
        self.window = window
        self.factory = ApplicationFactory()
    }
    
    func start() {
        showLoadingScreen()
        
        window?.rootViewController = presenter
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Private
    private func showLoadingScreen() {
        let vc = factory.createLoadingScreen()
        vc.onLoadingOutput = { [weak self] loadingScreen in
            switch loadingScreen {
            case .confirming:
                self?.showConfirmingScreen()
            case .signUp:
                self?.showSignUpScreen()
            case .home:
                self?.showTabBarScreen()
            default:
                break
            }
        }
        
        presenter.setViewControllers([vc], animated: true)
    }
    
    private func showConfirmingScreen() {
        let vc = factory.createConfirmingScreen()
        vc.onShowTerms = { [weak self] confirmingRow in
            self?.showTermsScreen(confirmingRow)
        }
        vc.onShowSignUp = { [weak self] in
            self?.showSignUpScreen()
        }
        presenter.setViewControllers([vc], animated: false)
    }
    
    private func showTermsScreen(_ confirmingRow: ConfirmingRow) {
        let vc = factory.createTermsScreen(confirmingRow)
        presenter.present(vc, animated: true)
    }
    
    func showSignUpScreen() {
        let coordinator = SignUpCoordinator()
        coordinator.start()
        
        window?.rootViewController = coordinator.presenter
    }
    
    private func showTabBarScreen() {
        let vc = factory.createTabBarScreen()
        presenter.setViewControllers([vc], animated: false)
    }
}

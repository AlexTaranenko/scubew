//
//  Factory.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

protocol Factory {
    
    func createTermsScreen(_ confirmingRow: ConfirmingRow) -> TermsViewController
    func createAccountScreen(_ user: UserModel?) -> AccountViewController
    func createTabBarScreen() -> TabBarViewController
}

extension Factory {
    func createTermsScreen(_ confirmingRow: ConfirmingRow) -> TermsViewController {
        let termsVC = TermsViewController.instantiate()
        termsVC.confirmingRow = confirmingRow
        return termsVC
    }
    
    func createAccountScreen(_ user: UserModel?) -> AccountViewController {
        let accountVC = AccountViewController.instantiate()
        accountVC.viewModel = AccountViewModel(user: user)
        return accountVC
    }
    
    func createTabBarScreen() -> TabBarViewController {
        return TabBarViewController()
    }
}

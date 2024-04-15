//
//  ApplicationFactory.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import Foundation

class ApplicationFactory: Factory {
    
    func createLoadingScreen() -> LoadingViewController {
        let loadingVC = LoadingViewController.instantiate()
        loadingVC.viewModel = LoadingViewModel()
        return loadingVC
    }
    
    func createConfirmingScreen() -> ConfirmingViewController {
        let confirmingVC = ConfirmingViewController.instantiate()
        confirmingVC.viewModel = ConfirmingViewModel()
        return confirmingVC
    }    
}

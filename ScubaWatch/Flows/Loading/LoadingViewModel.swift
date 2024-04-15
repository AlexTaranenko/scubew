//
//  LoadingViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import Foundation

class LoadingViewModel: LoadingInterface, LoadingOutput {
        
    // MARK: - LoadingInterface
    
    var onLoadingOutput: ((LoadingScreen) -> Void)?
    
    func getLoadingData() {
        // TODO: Need logic for data
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if AppStorage.instance.isLoggedIn {
                self.onLoadingOutput?(.home)
            } else if AppStorage.instance.confirmedBirthday {
                self.onLoadingOutput?(.signUp)
            } else {
                self.onLoadingOutput?(.confirming)
            }
        }
    }
}

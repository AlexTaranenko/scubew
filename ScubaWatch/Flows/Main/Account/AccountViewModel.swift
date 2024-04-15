//
//  AccountViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation

class AccountViewModel {
    
    var user: UserModel?
    let isEditAccount: Bool
    
    init(user: UserModel? = nil) {
        self.user = user
        self.isEditAccount = user != nil
    }
    
    var isActiveButton: Bool {
        guard !String.checkIsEmpty(user?.name) && !String.checkIsEmpty(user?.email) && !String.checkIsEmpty(user?.phoneNumber) else {
            return false
        }
        return true
    }
}

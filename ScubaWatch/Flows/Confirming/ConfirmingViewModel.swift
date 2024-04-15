//
//  ConfirmingViewModel.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import Foundation

class ConfirmingViewModel {
    
    enum ConfirmingError: Error {
        case checkMark
        case birthday
        
        var description: String {
            switch self {
            case .checkMark:
                return "checkMark_error".localized
            case .birthday:
                return "birthday_error".localized
            }
        }
    }
    
    var selectedDate: Date
    var isSelectCheckmark: Bool
    
    init() {
        self.selectedDate = Date()
        self.isSelectCheckmark = false
    }
    
    func checkPermissions() throws {
        guard isSelectCheckmark else {
            throw ConfirmingError.checkMark
        }
        
        let age = Calendar.current.dateComponents([.year], from: selectedDate, to: Date()).year ?? 0
        guard age != 0 && age >= 16 else {
            throw ConfirmingError.birthday
        }
    }
}

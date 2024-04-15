//
//  String+Extension.swift
//  ScubaWatch
//
//  Created by Alex on 05.07.2023.
//

import UIKit

extension String {
    static func checkIsEmpty(_ text: String?) -> Bool {
        return text?.isEmpty ?? true
    }
    
    static func checkField(_ text: String?) -> Bool {
        return !(text?.isEmpty ?? true) && !(text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true)
    }
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    func isValidPassword() -> Bool {
        return self.count >= 8
//        let passwordRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}

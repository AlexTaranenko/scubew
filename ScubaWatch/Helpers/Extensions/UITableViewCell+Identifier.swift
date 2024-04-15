//
//  UITableViewCell+Identifier.swift
//  Telepromter
//
//  Created by Alex on 30.04.2023.
//

import RESegmentedControl
import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    func clearBG() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func defaultBootstapPreset() -> BootstapPreset {
        return BootstapPreset(backgroundColor: .clear,
                              selectedBackgroundColor: .primaryWhite() ?? .white,
                              textColor: .primaryWhite() ?? .white,
                              selectedTextColor: .primaryBlack() ?? .black)
    }
}

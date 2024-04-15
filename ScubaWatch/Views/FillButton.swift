//
//  FillButton.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class FillButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cornerRadius = 10
        backgroundColor = .primaryBlue()
        tintColor = .primaryWhite()
        titleLabel?.font = .regularPoppins()
    }
    
    func activeButton(_ color: UIColor? = UIColor.primaryBlue()) {
        isUserInteractionEnabled = true
        backgroundColor = color
    }
    
    func inactiveButton(_ color: UIColor? = UIColor.primaryTransparentBlue()) {
        isUserInteractionEnabled = false
        backgroundColor = color
    }
}

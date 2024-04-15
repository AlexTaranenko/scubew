//
//  SemiBoldLabel.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

class SemiBoldLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        font = .semiBoldPoppins()
        textColor = .primaryWhite()
        numberOfLines = 0
    }
}

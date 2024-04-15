//
//  BoldLabel.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

class BoldLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        font = .boldPoppins()
        textColor = .primaryWhite()
        numberOfLines = 0
    }
}

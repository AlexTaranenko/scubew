//
//  RegularLabel.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

class RegularLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        font = .regularPoppins()
        textColor = .primaryWhite()
        numberOfLines = 0
    }
}

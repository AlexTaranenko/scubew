//
//  LineView.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class LineView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .primaryWhite()
    }
}

extension LineView {
    func thinDivider() {
        for c in constraints {
            if c.constant == 1 {
                c.constant = (1.0 / UIScreen.main.scale)
            }
        }
    }
}

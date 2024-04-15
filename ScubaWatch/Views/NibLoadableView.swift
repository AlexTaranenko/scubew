//
//  NibLoadableView.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class NibLoadableView: UIView, NibLoadable {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        setupFromXib()
    }
}

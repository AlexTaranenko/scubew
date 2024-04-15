//
//  UINavigationBar+Color.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import UIKit

extension UINavigationBar {

    func setBottomBorderColor(_ color: UIColor?, _ height: CGFloat) {
        let bottomBorderRect = CGRect(x: 0, y: frame.height, width: frame.width, height: height)
        let bottomBorderView = UIView(frame: bottomBorderRect)
        bottomBorderView.backgroundColor = color
        bottomBorderView.tag = 1234512
        addSubview(bottomBorderView)
    }
    
    func removeBottomBorder() {
        subviews.forEach({
            if $0.tag == 1234512 {
                $0.removeFromSuperview()
            }
        })
    }
}

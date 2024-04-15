//
//  UITextField+Extensions.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

extension UITextField {
    
    func addPaddingAndIcon(_ image: UIImage?, padding: CGFloat, isLeftView: Bool = true) {
        guard let image = image else { return }
        let frame = CGRect(x: 0, y: 0, width: image.size.width + padding, height: image.size.height)
        
        let outerView = UIView(frame: frame)
        let iconView  = UIImageView(frame: frame)
        iconView.image = image
        iconView.contentMode = .center
        outerView.addSubview(iconView)
        
        if isLeftView {
            leftViewMode = .always
            leftView = outerView
        } else {
            rightViewMode = .always
            rightView = outerView
        }
    }
}

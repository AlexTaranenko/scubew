//
//  UIButton+onTouchUpInSide.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

private var onTouchUpInSideKey = 288999188

public extension UIButton {
    var onTouchUpInSide: ((UIButton) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &onTouchUpInSideKey) as? ((UIButton) -> Void)
        }
        set {
            if let value = newValue {
                objc_setAssociatedObject(self, &onTouchUpInSideKey, value, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
                addTarget(self, action: #selector(didTouchUpInSide(button:)), for: .touchUpInside)
                
            } else {
                objc_setAssociatedObject(self, &onTouchUpInSideKey, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
                removeTarget(self, action: #selector(didTouchUpInSide(button:)), for: .touchUpInside)
            }
        }
    }
    
    @objc private func didTouchUpInSide(button: UIButton) {
        onTouchUpInSide?(button)
    }
}

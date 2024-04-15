//
//  UIView+Designable.swift
//  ScubaWatch
//
//  Created by Alex on 03.07.2023.
//

import UIKit

protocol Designable {
    
    var cornerRadius: CGFloat { get set }
    var borderWidth: CGFloat { get set }
    var borderColor: UIColor? { get set }
    var shadowColor: UIColor? { get set }
    var shadowOffset: CGSize { get set }
    var shadowRadius: CGFloat { get set }
    var shadowOpacity: Float { get set }
}

@IBDesignable extension UIView: Designable {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return self.layer.borderWidth }
        set { self.layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = self.layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set { self.layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = self.layer.shadowColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set { self.layer.shadowColor = newValue?.cgColor }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get { return self.layer.shadowOffset }
        set { self.layer.shadowOffset = newValue }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get { return self.layer.shadowRadius }
        set { self.layer.shadowRadius = newValue }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get { return self.layer.shadowOpacity }
        set { self.layer.shadowOpacity = newValue }
    }
}

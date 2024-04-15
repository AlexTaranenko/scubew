//
//  NibLoadable.swift
//  Telepromter
//
//  Created by Alex on 24.04.2023.
//

import UIKit

protocol NibLoadable {
    func setupFromXib()
}

extension NibLoadable where Self: UIView {
    func setupFromXib() {
        let bundle = Bundle(for: type(of: self))
        let className = NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
        let nib = UINib(nibName: className, bundle: bundle)
        
        let rootView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        rootView.frame = bounds
        rootView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(rootView)
    }
}

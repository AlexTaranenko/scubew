//
//  GradientView.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable public var startColor: UIColor = .black { didSet { updateColors() }}
    @IBInspectable public var endColor: UIColor = .white { didSet { updateColors() }}
    @IBInspectable public var startLocation: Double =   0.0 { didSet { updateLocations() }}
    @IBInspectable public var endLocation: Double =   1.0 { didSet { updateLocations() }}
    @IBInspectable public var horizontalMode: Bool =  false { didSet { updatePoints() }}
    @IBInspectable public var diagonalMode: Bool =  false { didSet { updatePoints() }}
    public var locations: [NSNumber]? =  nil { didSet { updateLocations() }}
    public var colors: [Any]? =  nil { didSet { updateColors() }}
    
    override public class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = locations ?? [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = colors ?? [startColor.cgColor, endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
        
    }
}

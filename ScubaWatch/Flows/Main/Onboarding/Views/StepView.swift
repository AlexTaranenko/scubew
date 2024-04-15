//
//  StepView.swift
//  ScubaWatch
//
//  Created by Alex on 07.07.2023.
//

import UIKit

class StepView: NibLoadableView, UIPresentable {
    
    @IBOutlet var stepImages: [UIImageView]!
    @IBOutlet var lineViews: [LineView]!
    
    var step: Int = 0 {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func updateUI() {
        stepImages.forEach({
            if $0.tag <= step {
                $0.image = Asset.Images.stepOn.image
            }
        })
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        lineViews.forEach({
            $0.backgroundColor = .primaryBlue()
        })
        
        stepImages.enumerated().forEach({
            $0.element.image = Asset.Images.stepOff.image
            $0.element.tag = $0.offset + 1
        })
    }
}

//
//  SliderValueView.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class SliderValueView: NibLoadableView, UIPresentable {
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: RegularLabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        titleLabel?.font = .regularPoppins(size: 15)
    }
    
    func populateSliderValue(_ title: String?, _ image: UIImage?) {
        titleLabel?.text = title
        imageView?.image = image
    }
}

//
//  SliderView.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class SliderView: NibLoadableView, UIPresentable {

    @IBOutlet weak var leftView: SliderValueView?
    @IBOutlet weak var rightView: SliderValueView?
    @IBOutlet weak var slider: UISlider!
    
    var onValueChanged: ((Float) -> Void)?
    
    var minValue: Float = 0 {
        didSet {
            slider.minimumValue = minValue
        }
    }
    var maxValue: Float = 1 {
        didSet {
            slider.maximumValue = minValue
        }
    }
    
    var currentValue: Float = 0.5 {
        didSet {
            slider.value = currentValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        slider.minimumTrackTintColor = .primaryDarkBle()
        slider.maximumTrackTintColor = .primaryGrey()
        slider.thumbTintColor = .primaryBlue()
        
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    func populateLeftView(_ title: String?, _ image: UIImage?) {
        leftView?.populateSliderValue(title, image)
    }
    
    func populateRightView(_ title: String?, _ image: UIImage?) {
        rightView?.populateSliderValue(title, image)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        onValueChanged?(sender.value)
    }
}

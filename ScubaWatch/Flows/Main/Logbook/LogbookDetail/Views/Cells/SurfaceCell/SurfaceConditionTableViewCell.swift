//
//  SurfaceConditionTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class SurfaceConditionTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var sliderView: SliderView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        titleLabel?.textColor = .primaryGrey()
        titleLabel?.font = .boldPoppins()
        
        sliderView?.populateLeftView("calm".localized,
                                     Asset.Images.waveCalmIcon.image.withTintColor(.primaryWhite() ?? .white))
        sliderView?.populateRightView("rough".localized,
                                      Asset.Images.waveRoughIcon.image.withTintColor(.primaryWhite() ?? .white))
        
        sliderView?.onValueChanged = { value in
            
        }
    }
}

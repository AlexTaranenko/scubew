//
//  CurrentTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class CurrentTableViewCell: UITableViewCell, UIPresentable {

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
        
        sliderView?.populateLeftView("none".localized,
                                     Asset.Images.currentNoneIcon.image.withTintColor(.primaryWhite() ?? .white))
        sliderView?.populateRightView("strong".localized,
                                      Asset.Images.currentStrongIcon.image.withTintColor(.primaryWhite() ?? .white))
        
        sliderView?.onValueChanged = { value in
            
        }
    }
}

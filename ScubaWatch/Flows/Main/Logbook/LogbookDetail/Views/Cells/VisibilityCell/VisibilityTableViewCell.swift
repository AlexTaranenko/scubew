//
//  VisibilityTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class VisibilityTableViewCell: UITableViewCell, UIPresentable {

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
        
        sliderView?.populateLeftView("clear".localized,
                                     Asset.Images.eyeOnIcon.image.withTintColor(.primaryWhite() ?? .white))
        sliderView?.populateRightView("murky".localized,
                                      Asset.Images.eyeOffIcon.image.withTintColor(.primaryWhite() ?? .white))
        
        sliderView?.onValueChanged = { value in
            
        }
    }
}

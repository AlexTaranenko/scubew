//
//  LocationDetailTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

class LocationDetailTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        titleLabel?.font = .semiBoldPoppins(size: 16)
        titleLabel?.textColor = .primaryWhite()
    }
}

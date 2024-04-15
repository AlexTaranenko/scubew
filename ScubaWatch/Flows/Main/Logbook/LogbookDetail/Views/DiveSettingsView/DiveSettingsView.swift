//
//  DiveSettingsView.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class DiveSettingsView: NibLoadableView, UIPresentable {
    
    @IBOutlet weak var resultLabel: BoldLabel?
    @IBOutlet weak var titleLabel: BoldLabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .clear
        resultLabel?.font = .boldPoppins(size: 24)
        titleLabel?.font = .boldPoppins(size: 15)
        titleLabel?.textColor = .primaryGrey()
    }
}

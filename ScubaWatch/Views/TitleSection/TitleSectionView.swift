//
//  TitleSectionView.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import UIKit

class TitleSectionView: NibLoadableView, UIPresentable {
    
    @IBOutlet weak var titleLabel: SemiBoldLabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        titleLabel?.font = .semiBoldPoppins(size: 17)
        titleLabel?.textColor = .primaryBlue()
    }
}

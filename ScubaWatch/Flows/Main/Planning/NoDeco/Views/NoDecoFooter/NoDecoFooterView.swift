//
//  NoDecoFooterView.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import UIKit

class NoDecoFooterView: NibLoadableView, UIPresentable {
    
    static let height: CGFloat = 138
    
    @IBOutlet weak var titleLabel: BoldLabel?
    @IBOutlet weak var resultLabel: BoldLabel?
    @IBOutlet weak var descriptionLabel: BoldLabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        titleLabel?.textColor = .primaryGrey()
        titleLabel?.font = .boldPoppins(size: 15)
        
        descriptionLabel?.textColor = .white
        descriptionLabel?.font = .boldPoppins(size: 16)
        
        resultLabel?.font = .boldPoppins(size: 32)
        
        descriptionLabel?.text = "no_deco_min".localized
        
        updateValues(0, 0)
    }
    
    func updateValues(_ mod: Double, _ min: Int) {
        titleLabel?.text = "\("mod".localized) \(String(format: "%.1f", mod)) \("m".localized)"
        resultLabel?.text = ":\(min)"
    }
}

//
//  DiveResultView.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class DiveResultView: NibLoadableView, UIPresentable {
    
    @IBOutlet weak var titleLabel: BoldLabel?
    @IBOutlet weak var resultLabel: RegularLabel?
    @IBOutlet weak var lineView: LineView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        titleLabel?.textColor = .primaryGrey()
        resultLabel?.textColor = .primaryGrey()
        
        lineView?.thinDivider()
    }
}

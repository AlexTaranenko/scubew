//
//  NavLeftItemView.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import UIKit

class NavItemView: NibLoadableView, UIPresentable, Clickable {
    
    @IBOutlet weak var iconView: UIImageView?
    @IBOutlet weak var titleLabel: SemiBoldLabel?
    @IBOutlet weak var layoutWidthIcon: NSLayoutConstraint?
        
    var onClick: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        onClick?()
    }
    
    func setupUI() {
        backgroundColor = .clear
        titleLabel?.font = .semiBoldPoppins(size: 21)
    }
    
    func populateNavLeftItem(_ image: UIImage?, _ title: String?) {
        iconView?.image = image
        titleLabel?.text = title
    }
}

//
//  UIViewController+Extension.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import KRProgressHUD
import UIKit

extension UIViewController {
    
    func setupBarItem(title: String? = nil,
                      image: UIImage? = nil,
                      iconWidth: CGFloat = 44,
                      fontSize: CGFloat = 21,
                      isRight: Bool = false,
                      onClick: (() -> Void)? = nil) {
        let navLeftItemView = NavItemView()
        navLeftItemView.setupUI()
        navLeftItemView.titleLabel?.font = .semiBoldPoppins(size: fontSize)
        navLeftItemView.populateNavLeftItem(image, title)
        navLeftItemView.layoutWidthIcon?.constant = iconWidth
        navLeftItemView.onClick = onClick
        
        if isRight {
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navLeftItemView)
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navLeftItemView)
        }
    }
    
    func addColorToShadow(_ color: UIColor?) {
        navigationController?.navigationBar.setBottomBorderColor(color, 0.5)
    }
    
    func removeBottomBorder() {
        navigationController?.navigationBar.removeBottomBorder()
    }
    
    func showHUD() {
        KRProgressHUD
            .set(style: .custom(background: .clear, text: .clear, icon: .clear))
            .set(maskType: .clear)
            .set(activityIndicatorViewColors: [
            .primaryWhite() ?? .white
        ])
            .show()
    }
    
    func dismissHUD() {
        KRProgressHUD.dismiss()
    }
}

//
//  NavBarAppereance.swift
//  Thrive Health
//
//  Created by Alex on 20.05.2020.
//  Copyright © 2020 Thrive Health. All rights reserved.
//

import Foundation
import UIKit

class NavigationBarAppearance {
    
    let appearance = UINavigationBarAppearance()
    
    init(backgroundColor: UIColor? = .clear,
         titleFont: UIFont = .systemFont(ofSize: 17),
         largeFont: UIFont = .boldSystemFont(ofSize: 24)) {
        appearance.configureWithDefaultBackground()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = backgroundColor
        appearance.shadowColor = .clear
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left
        
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.primaryWhite() as Any,
            .font: titleFont,
            .paragraphStyle: paragraph
        ]

        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.primaryWhite() as Any,
            .font: largeFont as Any
        ]
        
        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.clear as Any,
            .font: UIFont.systemFont(ofSize: 17)
        ]
        
        let backIcon = Asset.Images.backIcon.image
        appearance.setBackIndicatorImage(backIcon, transitionMaskImage: backIcon)
        appearance.backButtonAppearance = backButtonAppearance
        
        // Back Arrow
        UINavigationBar.appearance().tintColor = .primaryWhite()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

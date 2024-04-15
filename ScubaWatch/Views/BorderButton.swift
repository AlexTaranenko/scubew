//
//  BorderButton.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class BorderButton: UIButton {
    
    var leftImage: UIImage? {
        didSet {
            layoutSubviews()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let image = leftImage {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: image.size.width/2, y: bounds.height/2 - image.size.height/2, width: 24, height: 24)
            imageView.contentMode = .center
            imageView.clipsToBounds = true
            addSubview(imageView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderWidth = 1
        borderColor = .primaryWhite()
        cornerRadius = 10
        tintColor = .primaryWhite()
        titleLabel?.font = .regularPoppins()
    }    
}

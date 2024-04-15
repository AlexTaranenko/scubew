//
//  WelcomeTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import UIKit

class WelcomeTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var gradientView: GradientView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var stepLabel: UILabel?
    @IBOutlet weak var startButton: BorderButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientView?.startColor = .primaryBlue() ?? .blue
        gradientView?.endColor = .secondaryDarkBle()?.withAlphaComponent(0.6) ?? .blue
        gradientView?.diagonalMode = true
        gradientView?.cornerRadius = 20
    }
    
    func setupUI() {
        clearBG()
        
        let mutAttrString = NSMutableAttributedString(string: "welcome".localized, attributes: [
            .font: UIFont.boldPoppins(size: 28),
            .foregroundColor: UIColor.primaryWhite() as Any
        ])
        mutAttrString.append(NSAttributedString(string: "\n"))
        mutAttrString.append(NSAttributedString(string: "welcome_desc".localized, attributes: [
            .font: UIFont.regularPoppins(),
            .foregroundColor: UIColor.primaryWhite() as Any
        ]))
        
        titleLabel?.attributedText = mutAttrString
        
        stepLabel?.font = .boldPoppins(size: 15)
        stepLabel?.textColor = .primaryDarkBle()
        updateSteps(0)
        
        startButton?.setTitle("start".localized, for: .normal)
    }
    
    func updateSteps(_ step: Int) {
        stepLabel?.text = "\(step)/3 \("steps".localized)"
    }
}

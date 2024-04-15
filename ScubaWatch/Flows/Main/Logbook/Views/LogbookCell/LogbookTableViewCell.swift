//
//  LogbookTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

class LogbookTableViewCell: UITableViewCell, UIPresentable {
    
    @IBOutlet weak var gradientView: GradientView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    
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
        
        titleLabel?.font = .boldPoppins(size: 24)
        descriptionLabel?.font = .regularPoppins()
        dateLabel?.font = .boldPoppins(size: 15)
        
        [titleLabel, descriptionLabel].forEach({ $0?.textColor = .primaryWhite() })
        dateLabel?.textColor = .primaryDarkBle()
    }
    
    func populateLogbookCell(_ model: LogbookModel) {
        titleLabel?.text = model.title
        descriptionLabel?.text = model.street
        dateLabel?.text = model.date
    }
}

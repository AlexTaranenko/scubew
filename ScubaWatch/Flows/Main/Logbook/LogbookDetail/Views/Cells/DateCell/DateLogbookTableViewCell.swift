//
//  DateLogbookTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

class DateLogbookTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var titleLabel: RegularLabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
    }
}

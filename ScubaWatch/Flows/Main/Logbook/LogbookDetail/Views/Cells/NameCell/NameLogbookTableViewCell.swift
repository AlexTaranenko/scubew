//
//  NameLogbookTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

class NameLogbookTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var textFieldView: BaseTextFieldView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
    }
}

//
//  ConfirmingTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class ConfirmingTableViewCell: UITableViewCell, UIPresentable {

    // MARK: - Outlets
    @IBOutlet weak var titleArrowView: TitleArrowView?
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - UIPresentable
    func setupUI() {
        clearBG()
    }
}

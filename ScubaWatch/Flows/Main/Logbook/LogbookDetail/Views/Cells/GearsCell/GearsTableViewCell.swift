//
//  GearsTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class GearsTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var editButton: UIButton?
    
    var onEdit: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        titleLabel?.font = .regularPoppins(size: 15)
        titleLabel?.textColor = .primaryWhite()
        titleLabel?.text = "Shadow Mask\nT3 Yoke"
        
        editButton?.setTitle("edit".localized, for: .normal)
        editButton?.setTitleColor(.primaryBlue(), for: .normal)
        editButton?.titleLabel?.font = .regularPoppins(size: 15)
        editButton?.onTouchUpInSide = { [weak self] _ in
            self?.onEdit?()
        }
    }
}

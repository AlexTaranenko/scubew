//
//  ConfirmingHeader.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class ConfirmingHeader: NibLoadableView, UIPresentable, Clickable {
    
    @IBOutlet weak var titleLabel: RegularLabel?
    @IBOutlet weak var confirmButton: BorderButton?
    
    var onClick: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .clear
        titleLabel?.text = "confirm_birthday".localized
        confirmButton?.setTitle("confirm".localized, for: .normal)
        confirmButton?.onTouchUpInSide = { [weak self] _ in
            self?.onClick?()
        }
    }
}

//
//  DeleteFooterView.swift
//  ScubaWatch
//
//  Created by Alex on 13.07.2023.
//

import UIKit

class DeleteFooterView: NibLoadableView, UIPresentable {
    
    @IBOutlet weak var deleteButton: UIButton?
    
    static let height: CGFloat = 50.0
    
    var onDelete: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        deleteButton?.setTitle("delete".localized, for: .normal)
        deleteButton?.setTitleColor(.primaryRed(), for: .normal)
        deleteButton?.titleLabel?.font = .regularPoppins()
        deleteButton?.onTouchUpInSide = { [weak self] _ in
            self?.onDelete?()
        }
    }
}

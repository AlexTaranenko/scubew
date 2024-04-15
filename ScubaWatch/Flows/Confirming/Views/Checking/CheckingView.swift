//
//  CheckingView.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class CheckingView: NibLoadableView, UIPresentable {
    
    // MARK: - Outlets
    @IBOutlet weak var checkMarkButton: UIButton?
    @IBOutlet weak var titleLabel: RegularLabel?
    
    // MARK: - Properties
    var onSelectCheckmark: ((Bool) -> Void)?
    var isSelectCheckmark: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: - UIPresentable
    func setupUI() {
        isSelectCheckmark = false
        backgroundColor = .clear
        titleLabel?.font = .regularPoppins(size: 15)
        titleLabel?.text = "check_confirm".localized
        
        checkMarkButton?.setImage(Asset.Images.checkmarkOff.image, for: .normal)
        checkMarkButton?.setImage(Asset.Images.checkmarkOn.image, for: .selected)
        checkMarkButton?.onTouchUpInSide = { [weak self] button in
            self?.onSelectCheckmark?(!button.isSelected)
        }
    }
    
    func updateUI() {
        checkMarkButton?.isSelected = isSelectCheckmark
    }
}

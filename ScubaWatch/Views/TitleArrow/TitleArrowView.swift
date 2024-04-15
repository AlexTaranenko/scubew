//
//  TitleArrowView.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class TitleArrowView: NibLoadableView, UIPresentable, Clickable {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: RegularLabel?
    @IBOutlet weak var arrowButton: UIButton?
    @IBOutlet weak var lineView: LineView?
    
    // MARK: - Properties
    var text: String = "" {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Clickable
    var onClick: (() -> Void)?
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        onClick?()
    }

    // MARK: - UIPresentable
    func setupUI() {
        backgroundColor = .clear
        lineView?.thinDivider()
        
        updateArrowImage(.primaryWhite())        
        arrowButton?.onTouchUpInSide = { [weak self] _ in
            self?.onClick?()
        }
    }
    
    func activeState(_ color: UIColor? = .primaryWhite()) {
        isUserInteractionEnabled = true
        titleLabel?.textColor = color
        updateArrowImage(color)
    }
    
    func inactiveState(_ color: UIColor? = .primaryWhite()) {
        isUserInteractionEnabled = false
        titleLabel?.textColor = color?.withAlphaComponent(0.6)
        updateArrowImage(color?.withAlphaComponent(0.6))
    }
    
    private func updateArrowImage(_ color: UIColor?) {
        if let color = color {
            arrowButton?.setImage(Asset.Images.leftArrow.image.withTintColor(color), for: .normal)
        }
    }
    
    func updateUI() {
        titleLabel?.text = text
    }
}

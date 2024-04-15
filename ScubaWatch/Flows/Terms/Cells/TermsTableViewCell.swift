//
//  TermsTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class TermsTableViewCell: UITableViewCell, UIPresentable {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: RegularLabel?
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    var onTextLink: ((TextLink) -> Void)?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel?.attributedText = nil
    }
    
    func setupUI() {
        clearBG()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(linkDidTap(_:)))
        titleLabel?.isUserInteractionEnabled = true
        titleLabel?.addGestureRecognizer(tap)
    }
    
    // MARK: - Public
    func populateTermsCell(_ confirmingRow: ConfirmingRow?) {
        guard let confirmingRow = confirmingRow else { return }
        let mutAttrString = NSMutableAttributedString(string: confirmingRow.description, attributes: [
            .font: UIFont.regularPoppins(),
            .foregroundColor: UIColor.primaryWhite() as Any
        ])
        
        let textLink = confirmingRow == .data ? TextLink.privacyLaw : TextLink.terms
        let range = mutAttrString.mutableString.range(of: textLink.rawValue.localized)
        mutAttrString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        
        titleLabel?.attributedText = mutAttrString
    }
    
    // MARK: - Actions
    @objc func linkDidTap(_ gesture: UITapGestureRecognizer) {
        guard let label = gesture.view as? RegularLabel, let text = label.text else { return }
        let privacyLawRange = (text as NSString).range(of: TextLink.privacyLaw.rawValue.localized)
        let termsRange = (text as NSString).range(of: TextLink.terms.rawValue.localized)
        
        if gesture.didTapAttributedTextInLabel(label: label, inRange: privacyLawRange) {
            onTextLink?(.privacyLaw)
        } else if gesture.didTapAttributedTextInLabel(label: label, inRange: termsRange) {
            onTextLink?(.terms)
        }
    }
}

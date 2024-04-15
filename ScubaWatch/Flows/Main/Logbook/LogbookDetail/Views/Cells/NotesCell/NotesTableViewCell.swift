//
//  NotesTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class NotesTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var textView: UITextView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        containerView?.borderWidth = 0.5
        
        titleLabel?.font = .semiBoldPoppins(size: 17)
        titleLabel?.textColor = .primaryWhite()
        titleLabel?.text = "notes".localized
        
        textView?.font = .regularPoppins(size: 15)
        textView?.textColor = .primaryWhite()
        textView?.textContainerInset = .zero
        textView?.textContainer.lineFragmentPadding = 0
    }
}

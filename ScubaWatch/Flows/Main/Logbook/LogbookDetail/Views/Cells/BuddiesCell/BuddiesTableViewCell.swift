//
//  BuddiesTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 12.07.2023.
//

import UIKit

class BuddiesTableViewCell: NotesTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel?.text = "buddies".localized
        textView?.text = nil
        textView?.placeholder = "your_buddies_here".localized
    }
}

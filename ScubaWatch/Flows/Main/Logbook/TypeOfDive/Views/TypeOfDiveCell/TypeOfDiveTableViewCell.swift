//
//  TypeOfDiveTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 13.07.2023.
//

import UIKit

class TypeOfDiveTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var checkMark: UIImageView?
    @IBOutlet weak var lineView: LineView?
    @IBOutlet weak var titleLabel: RegularLabel?

    var isSelectType: Bool = false {
        didSet {
            let color: UIColor = .primaryWhite() ?? .white
            checkMark?.image = isSelectType ? Asset.Images.checkmarkOn.image.withTintColor(color) : Asset.Images.checkmarkOff.image.withTintColor(color)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        isSelectType = false
        lineView?.thinDivider()
    }
}

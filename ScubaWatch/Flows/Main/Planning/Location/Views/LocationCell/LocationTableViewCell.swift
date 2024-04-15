//
//  LocationTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import Foundation
import UIKit

class LocationTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var arrowImageView: UIImageView?
    @IBOutlet weak var lineView: LineView?
        
    private lazy var lengthFormatter: LengthFormatter = {
        return LengthFormatter()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel?.text = nil
        descriptionLabel?.text = nil
    }
    
    func setupUI() {
        clearBG()
        
        titleLabel?.font = .semiBoldPoppins(size: 16)
        descriptionLabel?.font = .regularPoppins(size: 16)
        arrowImageView?.image = Asset.Images.rightArrow.image.withTintColor(.primaryWhite() ?? .white)
        
        [titleLabel, descriptionLabel].forEach({ $0?.textColor = .primaryWhite() })
        
        lineView?.thinDivider()
    }
    
    func populateLocationCell(_ model: LocationModel) {
        titleLabel?.text = model.title
        
        if let distance = model.distance {
            let distanceText = lengthFormatter.string(fromValue: distance, unit: .kilometer)
            descriptionLabel?.text = "\(distanceText), \(model.street ?? "")"
        }
    }
    
    func populateLocationCell(_ title: String?, _ text: String?) {
        titleLabel?.text = title
        descriptionLabel?.text = text
    }
}

//
//  BaseTableView.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

class BaseTableView: UITableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        separatorStyle = .none
        backgroundColor = .clear
    }
}

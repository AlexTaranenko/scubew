//
//  Terms+Table.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

extension TermsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: TermsTableViewCell.self) as? TermsTableViewCell else { return UITableViewCell() }
        cell.onTextLink = { textLink in
            if let link = URL(string: textLink.link) {
                UIApplication.shared.open(link)
            }
        }
        cell.populateTermsCell(confirmingRow)
        
        return cell
    }
}

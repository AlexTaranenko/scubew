//
//  Logbook+Table.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

extension LogbookViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.logbooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: LogbookTableViewCell.self) as? LogbookTableViewCell else { return UITableViewCell() }
        let model = viewModel.logbooks[indexPath.row]
        cell.populateLogbookCell(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.logbooks[indexPath.row]
        onSHowLogbookDetail?(model)
    }
}

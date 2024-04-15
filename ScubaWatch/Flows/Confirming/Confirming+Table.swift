//
//  Confirming+Table.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

extension ConfirmingViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ConfirmingRow.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: ConfirmingTableViewCell.self) as? ConfirmingTableViewCell else { return UITableViewCell() }
        let confirmingRow = ConfirmingRow.allCases[indexPath.row]
        cell.titleArrowView?.text = confirmingRow.rawValue.localized
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let confirmingHeader = ConfirmingHeader()
        confirmingHeader.setupUI()
        confirmingHeader.onClick = { [weak self] in
            self?.showDatePicker(date: self?.viewModel?.selectedDate ?? Date(), sourceView: confirmingHeader.confirmButton, action: { selectedDate in
                self?.viewModel?.selectedDate = selectedDate
            })
        }
        return confirmingHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let confirmingRow = ConfirmingRow.allCases[indexPath.row]
        onShowTerms?(confirmingRow)
    }
}

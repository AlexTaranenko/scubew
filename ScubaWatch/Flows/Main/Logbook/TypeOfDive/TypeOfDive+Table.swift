//
//  TypeOfDive+Table.swift
//  ScubaWatch
//
//  Created by Alex on 13.07.2023.
//

import UIKit

extension TypeOfDiveViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TypeOfDive.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: TypeOfDiveTableViewCell.self) as? TypeOfDiveTableViewCell else { return UITableViewCell() }
        let typeOfDive = TypeOfDive.allCases[indexPath.row]
        cell.titleLabel?.text = typeOfDive.title
        cell.isSelectType = viewModel?.selectedTypeOfDive.first(where: {$0 == typeOfDive}) != nil
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let typeOfDive = TypeOfDive.allCases[indexPath.row]
        if let index = viewModel?.selectedTypeOfDive.firstIndex(where: {$0 == typeOfDive}) {
            viewModel?.selectedTypeOfDive.remove(at: index)
        } else {
            viewModel?.selectedTypeOfDive.append(typeOfDive)
        }
        tableView.reloadData()
    }
}

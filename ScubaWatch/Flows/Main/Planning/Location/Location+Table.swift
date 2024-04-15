//
//  Location+Table.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

extension LocationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredLocations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleSectionView = TitleSectionView()
        titleSectionView.setupUI()
        titleSectionView.backgroundColor = .primaryBlack()
        titleSectionView.titleLabel?.text = "recents".localized
        return titleSectionView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: LocationTableViewCell.self) as? LocationTableViewCell else { return UITableViewCell() }
        let model = viewModel.filteredLocations[indexPath.row]
        cell.populateLocationCell(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.filteredLocations[indexPath.row]
        onShowLocationDetail?(model)
    }
}

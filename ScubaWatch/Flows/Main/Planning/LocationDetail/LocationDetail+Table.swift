//
//  LocationDetail+Table.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

extension LocationDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleSectionView = TitleSectionView()
        titleSectionView.setupUI()
        titleSectionView.backgroundColor = .primaryBlack()
        if let distance = model?.distance {
            let lf = LengthFormatter()
            let distanceText = lf.string(fromValue: distance, unit: .kilometer)
            titleSectionView.titleLabel?.text = "\(distanceText), \(model?.street ?? "")"
        }
        return titleSectionView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: LocationDetailTableViewCell.self) as? LocationDetailTableViewCell else { return UITableViewCell() }
        cell.titleLabel?.text = "Shark Fin Rock is an Aboriginal engraving site located on the top of a large boulder – which looks like a shark’s fin – a short distance from Currawong Beach.\n\nShark Fin Rock is an Aboriginal engraving site located on the top of a large boulder – which looks like a shark’s fin – a short distance from Currawong Beach. Shark Fin Rock is an Aboriginal engraving site located on the top of a large boulder – which looks like a shark’s fin – a short distance from Currawong Beach.\n\nShark Fin Rock is an Aboriginal engraving site located on the top of a large boulder – which looks like a shark’s fin – a short distance from Currawong Beach."
        return cell
    }
}

//
//  NoDeco+Table.swift
//  ScubaWatch
//
//  Created by Alex on 10.07.2023.
//

import UIKit

extension NoDecoViewController: UITableViewDataSource, UITableViewDelegate {
    
    enum NoDecoSection: Int, CaseIterable {
        case nextDiveIn = 0, segment, nitrox, plannedDepth
        
        var title: String? {
            switch self {
            case .nextDiveIn: return "next_dive_in".localized
            case .plannedDepth: return "planned_depth".localized
            default: return nil
            }
        }
    }
    
    private var noDecoSections: [NoDecoSection] {
        if viewModel.noDecoSegmentRow == .air {
            return NoDecoSection.allCases.filter({$0 != .nitrox})
        }
        return NoDecoSection.allCases
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return noDecoSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let title = noDecoSections[section].title else { return nil }
        let titleSectionView = TitleSectionView()
        titleSectionView.setupUI()
        titleSectionView.titleLabel?.text = title
        return titleSectionView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noDecoSection = noDecoSections[indexPath.section]
        switch noDecoSection {
        case .nextDiveIn:
            guard let cell = tableView.dequeueCell(withType: DatePickerTableViewCell.self) as? DatePickerTableViewCell else { return UITableViewCell() }
            return cell
        case .segment:
            guard let cell = tableView.dequeueCell(withType: NoDecoSegmentTableViewCell.self) as? NoDecoSegmentTableViewCell else { return UITableViewCell() }
            cell.noDecoSegmentRow = viewModel.noDecoSegmentRow
            cell.onSegmentChanged = { [weak self] noDecoSegmentRow in
                self?.viewModel.noDecoSegmentRow = noDecoSegmentRow
                self?.tableView?.reloadData()
            }
            return cell
        case .nitrox:
            guard let cell = tableView.dequeueCell(withType: NitroxTableViewCell.self) as? NitroxTableViewCell else { return UITableViewCell() }
            return cell
        case .plannedDepth:
            guard let cell = tableView.dequeueCell(withType: DepthTableViewCell.self) as? DepthTableViewCell else { return UITableViewCell() }
            return cell
        }
    }
}

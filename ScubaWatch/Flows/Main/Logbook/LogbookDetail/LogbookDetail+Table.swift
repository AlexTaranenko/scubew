//
//  LogbookDetail+Table.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import UIKit

extension LogbookDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    enum LogbookDetailSection: Int, CaseIterable {
        case date = 0, map, title, profile, segment, settings, result, tankType, tankVolume, waterConditions, typeOfDive, notes, buddies, gearList, weights
        
        var title: String? {
            switch self {
            case .profile: return "dive_profile".localized
            case .settings: return "dive_settings".localized
            case .waterConditions: return "water_conditions".localized
            case .gearList: return "gear_list".localized
            default: return nil
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return LogbookDetailSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch LogbookDetailSection.allCases[section] {
        case .waterConditions:
            return WaterConditionsRow.allCases.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightHeaderSection(section)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return heightHeaderSection(section)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return heightFooterSection(section)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return heightFooterSection(section)
    }
    
    private func heightHeaderSection(_ section: Int) -> CGFloat {
        guard !String.checkIsEmpty(LogbookDetailSection.allCases[section].title) else {
            return 0.01
        }
        return UITableView.automaticDimension
    }
    
    private func heightFooterSection(_ section: Int) -> CGFloat {
        switch LogbookDetailSection.allCases[section] {
        case .title, .segment, .settings, .result, .tankType, .tankVolume, .waterConditions, .typeOfDive, .notes: return 30
        default: return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let title = LogbookDetailSection.allCases[section].title else { return nil }
        let titleSectionView = TitleSectionView()
        titleSectionView.setupUI()
        titleSectionView.titleLabel?.text = title
        titleSectionView.titleLabel?.textAlignment = .center
        return titleSectionView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = LogbookDetailSection.allCases[indexPath.section]
        switch section {
        case .date:
            guard let cell = tableView.dequeueCell(withType: DateLogbookTableViewCell.self) as? DateLogbookTableViewCell else { return UITableViewCell() }
            cell.titleLabel?.text = viewModel?.logbookModel.date
            return cell
        case .map:
            guard let cell = tableView.dequeueCell(withType: MapLogbookTableViewCell.self) as? MapLogbookTableViewCell else { return UITableViewCell() }
            cell.populateMapLogbookCell(52.239647, 21.045845)
            return cell
        case .title:
            guard let cell = tableView.dequeueCell(withType: NameLogbookTableViewCell.self) as? NameLogbookTableViewCell else { return UITableViewCell() }
            cell.textFieldView?.text = viewModel?.logbookModel.title
            cell.textFieldView?.placeholder = "name".localized
            return cell
        case .segment:
            guard let cell = tableView.dequeueCell(withType: SegmentChartTableViewCell.self) as? SegmentChartTableViewCell else { return UITableViewCell() }
            cell.chartType = viewModel?.chartType ?? .depth
            cell.onSegmentChanged = { [weak self] chartType in
                self?.viewModel?.chartType = chartType
                guard let profileIndex = LogbookDetailSection.allCases.firstIndex(where: {$0 == .profile}),
                let segmentIndex = LogbookDetailSection.allCases.firstIndex(where: {$0 == .segment}) else { return }
                self?.tableView?.reloadSections(IndexSet(integer: profileIndex), with: .automatic)
                self?.tableView?.reloadSections(IndexSet(integer: segmentIndex), with: .automatic)
            }
            return cell
        case .settings:
            guard let cell = tableView.dequeueCell(withType: SettingsLogbookTableViewCell.self) as? SettingsLogbookTableViewCell else { return UITableViewCell() }
            cell.populateSettingsLogbookCell()
            return cell
        case .result:
            guard let cell = tableView.dequeueCell(withType: DiveResultTableViewCell.self) as? DiveResultTableViewCell else { return UITableViewCell() }
            cell.populateDiveResultCell()
            return cell
        case .tankType:
            guard let cell = tableView.dequeueCell(withType: TankTypeTableViewCell.self) as? TankTypeTableViewCell else { return UITableViewCell() }
            cell.tankType = .steel
            return cell
        case .tankVolume:
            guard let cell = tableView.dequeueCell(withType: TankVolumeTableViewCell.self) as? TankVolumeTableViewCell else { return UITableViewCell() }
            cell.tankVolume = .L_10
            return cell
        case .waterConditions:
            let waterConditionsRow = WaterConditionsRow.allCases[indexPath.row]
            switch waterConditionsRow {
            case .visibility:
                guard let cell = tableView.dequeueCell(withType: VisibilityTableViewCell.self) as? VisibilityTableViewCell else { return UITableViewCell() }
                cell.titleLabel?.text = waterConditionsRow.title
                return cell
            case .surface:
                guard let cell = tableView.dequeueCell(withType: SurfaceConditionTableViewCell.self) as? SurfaceConditionTableViewCell else { return UITableViewCell() }
                cell.titleLabel?.text = waterConditionsRow.title
                return cell
            case .current:
                guard let cell = tableView.dequeueCell(withType: CurrentTableViewCell.self) as? CurrentTableViewCell else { return UITableViewCell() }
                cell.titleLabel?.text = waterConditionsRow.title
                return cell
            }
        case .typeOfDive:
            guard let cell = tableView.dequeueCell(withType: LocationTableViewCell.self) as? LocationTableViewCell else { return UITableViewCell() }
            let items = viewModel?.logbookModel.typeOfDive.map({$0.title}).joined(separator: ", ")
            cell.populateLocationCell("type_of_dive".localized, items)
            return cell
        case .notes:
            guard let cell = tableView.dequeueCell(withType: NotesTableViewCell.self) as? NotesTableViewCell else { return UITableViewCell() }
            return cell
        case .buddies:
            guard let cell = tableView.dequeueCell(withType: BuddiesTableViewCell.self) as? BuddiesTableViewCell else { return UITableViewCell() }
            return cell
        case .gearList:
            guard let cell = tableView.dequeueCell(withType: GearsTableViewCell.self) as? GearsTableViewCell else { return UITableViewCell() }
            return cell
        case .weights:
            guard let cell = tableView.dequeueCell(withType: WeightTableViewCell.self) as? WeightTableViewCell else { return UITableViewCell() }
            cell.titleLabel?.textColor = .primaryGrey()
            return cell
        case .profile:
            guard let cell = tableView.dequeueCell(withType: ChartTableViewCell.self) as? ChartTableViewCell else { return UITableViewCell() }
            cell.chartType = viewModel?.chartType ?? .depth
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = LogbookDetailSection.allCases[indexPath.section]
        switch section {
        case .typeOfDive:
            onShowTypeOfDive?(viewModel?.logbookModel.typeOfDive ?? [])
        default:
            break
        }
    }
}

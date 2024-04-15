//
//  Home+Table.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
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
        guard let cell = tableView.dequeueCell(withType: WelcomeTableViewCell.self) as? WelcomeTableViewCell else { return UITableViewCell() }
        cell.updateSteps(AppStorage.instance.step)
        cell.startButton?.onTouchUpInSide = { [weak self] _ in
            self?.onShowOnboarding?()
        }
        return cell
    }
}

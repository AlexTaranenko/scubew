//
//  UIViewController+Alert.swift
//  ScubaWatch
//
//  Created by Alex on 04.07.2023.
//

import UIKit

extension UIViewController {
    
    func showDatePicker(date: Date, sourceView: UIView? = nil, action: DatePickerView.Action?) {
        let minimumDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addDatePicker(mode: .date, date: date, minimumDate: minimumDate, action: action)
        alert.addAction(UIAlertAction(title: "done".localized, style: .default))
        alert.setupPopoverPresentationController(sourceView: sourceView)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func showErrorAlert(message: String?, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = AlertBuilder(title: "error".localized, message: message)
            .action(handler: handler)
            .build()
        alert.setupPopoverPresentationController()
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func showPhotoAlert(handler: ((PhotoPicker) -> Void)?) {
        let alert = AlertBuilder()
            .action(title: PhotoPicker.take.title, style: .default) { _ in
                handler?(.take)
            }
            .action(title: PhotoPicker.gallery.title, style: .default) { _ in
                handler?(.gallery)
            }
            .action(title: "cancel".localized, style: .cancel)
            .build()
        alert.setupPopoverPresentationController()
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   firstActionTitle: String = "ok".localized,
                   firstHandler: ((UIAlertAction) -> Void)? = nil,
                   secondActionTitle: String = "cancel".localized,
                   secondHandler: ((UIAlertAction) -> Void)? = nil
    ) {
        let alert = AlertBuilder(title: title, message: message)
            .action(title: secondActionTitle, handler: secondHandler)
            .action(title: firstActionTitle, handler: firstHandler)
            .build()
        alert.setupPopoverPresentationController()
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func showDeleteAlert(message: String? = nil,
                         firstHandler: ((UIAlertAction) -> Void)? = nil,
                         secondHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = AlertBuilder(message: message)
            .action(title: "delete".localized, style: .destructive, handler: firstHandler)
            .action(title: "cancel".localized, style: .cancel, handler: secondHandler)
            .build()
        alert.setupPopoverPresentationController()
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}

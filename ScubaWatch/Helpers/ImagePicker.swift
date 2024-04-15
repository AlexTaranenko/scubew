//
//  ImagePicker.swift
//  ScubaWatch
//
//  Created by Alex on 06.07.2023.
//

import UIKit
import AVFoundation
import Photos

protocol ImagePickerDelegate: class {
    
    func imagePicker(_ imagePicker: ImagePicker, grantedAccess: Bool,
                     to sourceType: UIImagePickerController.SourceType)
    func imagePicker(_ imagePicker: ImagePicker, didSelect image: UIImage)
    func cancelButtonDidClick(on imageView: ImagePicker)
}

class ImagePicker: NSObject {
    
    private weak var controller: UIImagePickerController?
    weak var delegate: ImagePickerDelegate?
    
    func dismiss() { controller?.dismiss(animated: true, completion: nil) }
    
    func present(parent viewController: UIViewController, sourceType: UIImagePickerController.SourceType) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = sourceType
        self.controller = controller
        
        DispatchQueue.main.async {
            viewController.present(controller, animated: true, completion: nil)
        }
    }
}

// MARK: Get access to camera or photo library

extension ImagePicker {
    
    private func showAlert(targetName: String, completion: ((Bool) -> Void)?) {
        let alert = AlertBuilder(title: "\("access_to_the".localized) \(targetName)",
                                 message: "\("provide_access".localized) \(targetName)")
            .action(title: "settings".localized, style: .default) { _ in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
                      UIApplication.shared.canOpenURL(settingsUrl) else { completion?(false); return }
                UIApplication.shared.open(settingsUrl, options: [:]) { [weak self] _ in
                    self?.showAlert(targetName: targetName, completion: completion)
                }
            }
            .action(title: "cancel".localized, style: .cancel) { _ in
                completion?(false)
            }
            .build()
        
        DispatchQueue.main.async {
            UIApplication.shared.windows.filter { $0.isKeyWindow }.first?
                .rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func cameraAsscessRequest() {
        if delegate == nil { return }
        let source = UIImagePickerController.SourceType.camera
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
            delegate?.imagePicker(self, grantedAccess: true, to: source)
        } else {
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard let self = self else { return }
                if granted {
                    self.delegate?.imagePicker(self, grantedAccess: granted, to: source)
                } else {
                    self.showAlert(targetName: "camera".localized) { self.delegate?.imagePicker(self, grantedAccess: $0, to: source) }
                }
            }
        }
    }
    
    func photoGalleryAsscessRequest() {
        PHPhotoLibrary.requestAuthorization { [weak self] result in
            guard let self = self else { return }
            let source = UIImagePickerController.SourceType.photoLibrary
            if result == .authorized {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.delegate?.imagePicker(self, grantedAccess: result == .authorized, to: source)
                }
            } else {
                self.showAlert(targetName: "gallery".localized) { self.delegate?.imagePicker(self, grantedAccess: $0, to: source) }
            }
        }
    }
}

// MARK: UINavigationControllerDelegate

extension ImagePicker: UINavigationControllerDelegate { }

// MARK: UIImagePickerControllerDelegate

extension ImagePicker: UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            delegate?.imagePicker(self, didSelect: image)
            return
        }

        if let image = info[.originalImage] as? UIImage {
            delegate?.imagePicker(self, didSelect: image)
        } else {
            print("Other source")
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        delegate?.cancelButtonDidClick(on: self)
    }
}

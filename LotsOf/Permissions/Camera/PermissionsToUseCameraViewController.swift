//
//  PermissionsToUseCameraViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 29/10/22.
//

import UIKit

final class PermissionsToUseCameraViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
}

extension PermissionsToUseCameraViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}

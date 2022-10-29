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
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PermissionsToUseCameraViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}

//
//  UpdateViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import UIKit

final class UpdateViewController: UIViewController {
    let viewModel = OdenzaViewModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

  
    @IBAction func updateButtonAction(_ sender: UIButton) {
        let title = titleLabel.text ?? "No title"
        let body = bodyTextView.text ?? "No body"
        
        let paratemers : [String: Any] = ["title": title, "body": body]
        viewModel.updatePosts(parameters: paratemers)
    }
    deinit {
        print("    [DEINIT] ->      UpdateViewController")
    }
}

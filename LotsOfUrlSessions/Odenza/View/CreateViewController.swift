//
//  CreateViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//

import UIKit

final class CreateViewController: UIViewController {
    
    var viewModel = OdenzaViewModel()
    var postTitle = "title"
    var postBody = "body"
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func postAction(_ sender: UIButton) {
        postTitle = titleTextField.text ?? "No title"
        postBody = bodyTextView.text ?? "No body"
        
        let parameters: [String: Any] = ["userId": 9, "title": postTitle, "body": postBody]
        viewModel.createPosts(parameters: parameters)
    }
}

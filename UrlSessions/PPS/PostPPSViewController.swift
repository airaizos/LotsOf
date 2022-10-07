//
//  postPPSViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/10/22.
//

import UIKit

final class PostPPSViewController: UIViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    let viewModel = PostPPSViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupView()
    }
    
    func loadData() {
        viewModel.getFetch()
    }
    
    func setupView() {

        if viewModel.post.isEmpty {
            postImage.image = UIImage(named: "loadingImage.jpeg")
            titleLabel.text = "Title"
            authorLabel.text = "Author"
            avatarImage.image = UIImage(named: "loadingImage.jpeg")
            bodyTextView.text = "body"
        } else {
            postImage.image = UIImage(named: "\(viewModel.post[0].postImage)")
            titleLabel.text = viewModel.post[0].title
            authorLabel.text = viewModel.post[0].author
            bodyTextView.text = viewModel.post[0].excerpt
            
        }
        
        
        
    }


}

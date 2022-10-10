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
        
        guard let post = viewModel.provider.post else { return  }
       
        postImage.image = post.postImage
        print("\(post.postImage)")
        
        avatarImage.image = post.authorImage
        print("\(post.authorImage)")
        titleLabel.text = post.title
        authorLabel.text = post.author
        bodyTextView.text = post.excerpt.html2String
    }
   
    @IBAction func refreshViewButton(_ sender: UIButton) {
        setupView()
    }
    
}

//
//  UsersCollectionViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/9/22.
//

import UIKit

final class UsersCollectionViewController: UIViewController {
    var viewModel = UserViewModel()
    let radius: CGFloat = 8.0
    
    @IBOutlet weak var usersLabel: UILabel!
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupView()
        
    }
    
    func setupView() {
        usersLabel.layer.cornerRadius = radius
        usersCollectionView.layer.cornerRadius = radius
    }
    
    
}





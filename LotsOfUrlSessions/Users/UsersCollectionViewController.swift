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
    private let cellIdentifier = "userCell"
    
    @IBOutlet weak var usersLabel: UILabel!
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupView()
        viewModel.fetchUsers()
    }
    
    func setupView() {
        usersLabel.layer.cornerRadius = radius
        usersCollectionView.layer.cornerRadius = radius
        usersCollectionView.reloadData()
        usersLabel.text = "Users List"
    }
    func setupCollectionView() {
        usersCollectionView.delegate = self
        usersCollectionView.dataSource = self
        
     
    //    usersCollectionView.register(UserCell.self, forCellWithReuseIdentifier: cellIdentifier)
usersCollectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)

    }
    
    
    @IBAction func refreshCollectionView(_ sender: UIButton) {
            self.usersCollectionView.reloadData()
    }
   
}

extension UsersCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.users[indexPath.row]

        guard let cell = usersCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? UserCell else { fatalError("No se puede cargar userCollectionCell")}
        
        cell.configure(with: item)
        
        return cell
    }
    
    

}

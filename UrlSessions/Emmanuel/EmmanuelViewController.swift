//
//  EmmanuelViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/9/22.
//

import UIKit

final class EmmanuelViewController: UIViewController, UICollectionViewDelegate {
    
    let viewModel = EmmanuelViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchPosts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.postPosts()
    }
    
    
    func setupView() {
        title = "Emmanuel Posts"
        collectionView.delegate = self
        collectionView.dataSource = self
        binding()
    }
    
    func binding() {
        viewModel.refreshPost = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
           //     self?.loadButton.titleLabel?.text = self?.viewModel.titleButton()
            }
        }
    }
    
}


extension EmmanuelViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.emmanuelPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmmanuelViewCell", for: indexPath) as? EmmanuelViewCell else { fatalError() }
        
        let model = viewModel.emmanuelPosts[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

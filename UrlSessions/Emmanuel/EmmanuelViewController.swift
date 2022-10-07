//
//  EmmanuelViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/9/22.
//

import UIKit

final class EmmanuelViewController: UIViewController {

    let viewModel = EmmanuelViewModel()
    @IBOutlet weak var loadButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchPosts()
    }
    
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        reloadData()
        viewModel.postPosts()
    }
    
    
    func setupView() {
        title = "Emmanuel Posts"
        collectionView.dataSource = self
        collectionView.register(EmmanuelPostsCollectionViewCell.self, forCellWithReuseIdentifier: "emmanuelCollectionCell")
    }

    
    @IBAction func loadAction(_ sender: UIButton) {
        loadButton.titleLabel?.text = viewModel.titleButton()
        
        print("\(String(describing: loadButton.titleLabel?.text))")
        view.layoutSubviews()
    }
    @objc private func loadData() {
        
    }
    
}


extension EmmanuelViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.emmanuelPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emmanuelCollectionCell", for: indexPath) as! EmmanuelPostsCollectionViewCell
        
        let model = viewModel.emmanuelPosts[indexPath.row]
        
        cell.configure(with: model)
        return cell
    }
}

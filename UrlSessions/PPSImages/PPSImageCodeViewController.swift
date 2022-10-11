//
//  PPSImageCodeViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 11/10/22.
//

import UIKit

@available(iOS 14.0, *)
final class PPSImageCodeViewController: UIViewController {
    let viewModel = PPSImagesViewModel()
    
    lazy var imageCollectionView: UICollectionView = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       
        return collectionView
    }()
    
    lazy var imagesDataSource: UICollectionViewDiffableDataSource<Int,FotoUUID> = {
        let fotoCell = UICollectionView.CellRegistration<UICollectionViewCell,FotoUUID> { cell, indexPath, model in
            var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.image = model.image
            
            cell.contentConfiguration = listContentConfiguration
        }
        let dataSource = UICollectionViewDiffableDataSource<Int,FotoUUID>(collectionView: imageCollectionView) { collectionView, indexPath, model in
            
            return collectionView.dequeueConfiguredReusableCell(using: fotoCell, for: indexPath, item: model)
        }
        return dataSource
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getImages()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupImageCollectionView()
    }
    
    func setupView() {
        view.backgroundColor = .systemPink
        view.addSubview(imageCollectionView)
        
        NSLayoutConstraint.activate([
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40),
            imageCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30)
        ])
    }

    
    //recupera las imágenes, pero no las muestra
    func setupImageCollectionView() {
        DispatchQueue.main.async {
            var snapshot = self.imagesDataSource.snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(self.viewModel.imagesPPS)
            self.imagesDataSource.apply(snapshot)
        }
    }
}




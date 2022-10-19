//
//  PPSImageViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 10/10/22.
//

import UIKit

@available(iOS 14.0, *)

final class PPSImageViewController: UIViewController {
    let viewModel = PPSImagesViewModel()
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    @IBOutlet weak var videosCollectionView: UICollectionView!
    
    
    lazy var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    lazy var layout = UICollectionViewCompositionalLayout.list(using: configuration)
    
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
        
        bind()
    }
    private func bind() {
        viewModel.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.setupImageCollectionView()
            }
            
        }
    }
    
    //recupera las imágenes, pero no las muestra
    func setupImageCollectionView() {
        
        var snapshot = self.imagesDataSource.snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(self.viewModel.imagesPPS)
        self.imagesDataSource.apply(snapshot)
        
    }
    
}


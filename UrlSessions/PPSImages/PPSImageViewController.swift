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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


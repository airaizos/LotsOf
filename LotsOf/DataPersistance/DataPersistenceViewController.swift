//
//  DataPersistenceViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
//

import UIKit

final class DataPersistenceViewController: UIViewController {
    //MARK: Variables
    var cellName = DataPersistenceCell.description()
    
    var provider = DataPersistenceLocalProvider()

   
    var cellScale: CGFloat = 1
    
    //MARK: Outlets
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: LifeCycle
    override func viewWillAppear(_ animated: Bool) {
         setupData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupCollectionView()
    }
    
    
    //MARK: Functions
    func setupData() {
        provider.fetch()
        
    }
    
    func setupCollectionView() {
        /*
        let screenSize = UIScreen.main.bounds.size
               let cellWidth = floor(screenSize.width * cellScale )
               let cellHeight = floor(screenSize.height * cellScale)
               let instX = ( view.bounds.width - cellWidth ) / 2
               let instY = ( view.bounds.height - cellHeight ) / 2
               let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
               
               layout.itemSize = CGSize(width: cellWidth, height: cellHeight )
               collectionView.contentInset = UIEdgeInsets(top: instY , left: instX , bottom: instY, right: instX )
        */
               collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "DataPersistenceCell", bundle: .main), forCellWithReuseIdentifier: "dataPersistenceCell" )
    }
    
    
    
    
    deinit {
        print("    [DEINIT] ->      DATAPersistence ViewController")
    }
}


extension DataPersistenceViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        provider.apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataPersistenceCell", for: indexPath) as! DataPersistenceCell
        
        let item = provider.apps[indexPath.item]
        
        cell.configure(with: item)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
}

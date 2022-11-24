//
//  QatarGroupsViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 21/11/22.
//

import UIKit

final class QatarGroupsViewController: UIViewController {
    
    //MARK: Variables
    let provider = QatarGroupsProvider()
    var cellScale: CGFloat = 0.6
    
    //MARK: Outlets
    
    @IBOutlet weak var groupsCollectionView: UICollectionView!
    
    //MARK: LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        getGroups()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    
    }
    //MARK: Functions
    
    func getGroups() {
        provider.fetchWorldCupGroups()
        provider.createGroups(from: provider.worldCupGroups!)
    }
    func setupView() {
        view.backgroundColor = .lightGray
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let instX = ( view.bounds.width - cellWidth ) / 2.0
        let instY = ( view.bounds.height ) - cellHeight / 2.0
        let layout = groupsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        groupsCollectionView.contentInset = UIEdgeInsets(top: instY, left: instX, bottom: instY, right: instX)
        groupsCollectionView.dataSource  = self
     
        groupsCollectionView.register(UINib(nibName: "GroupCell", bundle: .main), forCellWithReuseIdentifier: "groupCell")
    }
    

}


extension QatarGroupsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return provider.groups["GroupA"]!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  groupsCollectionView.dequeueReusableCell(withReuseIdentifier: "groupCell", for: indexPath) as! GroupCell
        let item = provider.groups["GroupA"]![indexPath.item]
        
        cell.configure(with: item)
    //    cell.setupLayer()
        return cell
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
}

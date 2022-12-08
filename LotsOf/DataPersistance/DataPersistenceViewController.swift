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
    var viewModel = DataPersistenceViewModel()
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
        viewModel.getInfo()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "DataPersistenceCell", bundle: .main), forCellWithReuseIdentifier: "dataPersistenceCell" )
    }
    
    deinit {
        print("    [DEINIT] ->      DATAPersistence ViewController")
    }
}


extension DataPersistenceViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataPersistenceCell", for: indexPath) as! DataPersistenceCell
        
        let item = viewModel.apps[indexPath.item]
        
        cell.configure(with: item)
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.didSelectItem(at: indexPath)
        navigate(to: item)
    }
    
    func navigate(to item: AppInfo) {
      
        if let myClass = classFromString(item.viewController) as? UIViewController.Type {
            let instance = myClass.init()
            
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(instance, animated: true)
            }
            
        } else {
            
            
            DispatchQueue.main.async {
                self.goTo(viewControllerName: item.viewController)
            }
        }
    }
    
    func classFromString(_ className: String) -> AnyClass!  {
        
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!
        
        return cls
    }
    
    
}



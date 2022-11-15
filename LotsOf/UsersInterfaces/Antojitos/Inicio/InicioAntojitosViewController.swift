//
//  AntojitosInicioViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import UIKit

final class InicioAntojitosViewController: UIViewController {
    
    //MARK: Variables
   var exclusivesPromoViewModel = ExclusivesPromosViewModel()
    private let exclusiveCell = "exclusiveCell"

    //MARK: Outlets
    @IBOutlet weak var promotionalCodeView: PromotionalCodeView!
    @IBOutlet weak var exclusivesPromosCollectionView: UICollectionView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupExclusivesPromoCollectionView()
    }
    
   //MARK: IBActions
    @IBAction func exit(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
    }
    
    //MARK: Functions
    private func setupView() {
        promotionalCodeView.setup(presentationController: self)
    }
    private func setupExclusivesPromoCollectionView() {
        
        exclusivesPromosCollectionView.delegate = self
        exclusivesPromosCollectionView.dataSource = self
        exclusivesPromosCollectionView.register(UINib(nibName: exclusiveCell, bundle: nil), forCellWithReuseIdentifier: exclusiveCell)
        exclusivesPromoViewModel.fetchItems()
    }
    
    private func bind() {
        exclusivesPromoViewModel.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.exclusivesPromosCollectionView.reloadData()
            }
            
        }
    }
    
    deinit {
        print("    [DEINIT] ->      ANTOJITOSINICIO ViewController")
    }
}


extension InicioAntojitosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        exclusivesPromoViewModel.getNumberItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = exclusivesPromoViewModel.exclusivePromos[indexPath.row]
        guard let cell = exclusivesPromosCollectionView.dequeueReusableCell(withReuseIdentifier: exclusiveCell, for: indexPath) as? ExclusiveCollectionViewCell else { fatalError("")}
        cell.configure(with: item)
        
        return cell
    }
    
}

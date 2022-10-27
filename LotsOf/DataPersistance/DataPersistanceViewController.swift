//
//  DataPersistanceViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
//

import UIKit

final class DataPersistanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    //Navigation Buttons
    
    @IBAction func enumButtonAction(_ sender: UIButton) {
        let viewController = EnumUserDefaultViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func moureDevButtonAction(_ sender: UIButton) {
        let viewController = MourdevUserDefaultsViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func ofertaButtonAction(_ sender: UIButton) {
        goTo(viewControllerName: "OfertaListViewController")
    
    }
    
    @IBAction func QuotesButtonAction(_ sender: UIButton) {
        let viewController = QuotesViewController()
        
        viewController.modelController = ModelController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    deinit {
        print("    [DEINIT] ->      DATAPERSISTANCE ViewController")
    }
}

//
//  OdenzaViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//

import UIKit

final class OdenzaViewController: UIViewController {
    let viewModel = OdenzaViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 15.0, *) {
            view.backgroundColor = .systemMint
        } else {
            view.backgroundColor = .systemBlue
        }
    }
    
    
    @IBAction func getActionButton(_ sender: UIButton) {
        let viewController = GetViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func postActionButton(_ sender: UIButton) {
        goTo(viewControllerName: "CreateViewController")
    }
    @IBAction func updateActionButton(_ sender: UIButton) {
        goTo(viewControllerName: "UpdateViewController")
        
    }
    @IBAction func deleteActionButton(_ sender: UIButton) {
        viewModel.deletePosts()
    }
 
    func goTo(navigationController: UIViewController) -> UIViewController {
        let viewController = navigationController
        let navigationController  = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}

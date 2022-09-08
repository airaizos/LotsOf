//
//  OdenzaViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//

import UIKit

final class OdenzaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 15.0, *) {
            view.backgroundColor = .systemMint
        } else {
            view.backgroundColor = .systemBlue
        }
    }
    
    
    @IBAction func getActionButton(_ sender: UIButton) {
        self.present(goTo(navigationController: GetViewController()),animated: true)
    }
    @IBAction func postActionButton(_ sender: UIButton) {
        goTo(viewControllerName: "CreateViewController")
    }
    @IBAction func updateActionButton(_ sender: UIButton) {
        goTo(viewControllerName: "UpdateViewController")
        
    }
    @IBAction func deleteActionButton(_ sender: UIButton) {
    }
 
    
    func goTo(viewControllerName: String){
        let storyboard = UIStoryboard(name: viewControllerName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        print("goTo\(viewControllerName)")
        self.present(viewController, animated: true)
    }
    
    func goTo(navigationController: UIViewController) -> UIViewController {
        let viewController = navigationController
        let navigationController  = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}

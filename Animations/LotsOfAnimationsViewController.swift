//
//  LotsOfAnimationsViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 28/9/22.
//

import UIKit

final class LotsOfAnimationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func goToChaseButton(_ sender: UIButton) {
        let viewController = ChaseButtonViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

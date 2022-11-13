//
//  NuevoPedidoViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import UIKit

final class NuevoPedidoAntojitosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    
    @IBAction func confirmButtonAction(_ sender: UIButton) {
        let viewController = InitialAntojitosControllerBuilder().build()
        
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    deinit {
        print("    [DEINIT] ->      NUEVOPEDIDO ViewController")
    }
}

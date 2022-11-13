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
    
    
    @IBAction func confirmButtonAction(_ sender: UIButton) {
       
        self.navigationController?.pushViewController(InitialAntojitosControllerBuilder().build(), animated: true)
    }
    
    deinit {
        
        print("    [DEINIT] ->      NUEVOPEDIDO ViewController")
    }

}

//
//  NuevoPedidoViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import UIKit

final class NuevoPedidoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func confirmButtonAction(_ sender: UIButton) {
        goTo(viewControllerName: "AntojitosInicioViewController")
    }
    
    deinit {
        
        print("    [DEINIT] ->      NUEVOPEDIDO ViewController")
    }

}

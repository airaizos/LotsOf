//
//  AntojitosInicioViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import UIKit

final class AntojitosInicioViewController: UIViewController {

    @IBOutlet weak var inicioScrollView: InicioScrollView!
    
    @IBOutlet weak var promotionalCodeView: PromotionalCodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupView()
    }
    
    func setupView() {
       /* self.promotionalCodeView = PromotionalCodeView(presentationController: self)
        */
    }

    deinit {
        print("    [DEINIT] ->      ANTOJITOSINICIO ViewController")
    }
}

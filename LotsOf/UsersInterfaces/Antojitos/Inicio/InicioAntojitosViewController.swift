//
//  AntojitosInicioViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import UIKit

final class InicioAntojitosViewController: UIViewController {
    
    //MARK: Variables
   

   
    
    
    //MARK: Outlets
    @IBOutlet weak var promotionalCodeView: PromotionalCodeView!
    
    @IBOutlet weak var inicioScrollView: InicioScrollView!
    
    
    //MARK: LifeCycle
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    
    //MARK: Functions
    func setupView() {
        promotionalCodeView.setup(presentationController: self)
        inicioScrollView.setup(presentationController: self)
        
    }
    
    deinit {
        print("    [DEINIT] ->      ANTOJITOSINICIO ViewController")
    }
}

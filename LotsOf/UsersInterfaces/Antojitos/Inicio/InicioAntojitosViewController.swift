//
//  AntojitosInicioViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import UIKit

final class InicioAntojitosViewController: UIViewController {
    
    //MARK: Variables
    let antojitosTabBarController = UITabBarController()
//    let inicioVC = InicioAntojitosViewController()
    let promocionesVC = PromocionesAntojitosViewController()
    let cartaVC = CartaAntojitosViewController()
    let miAntojitosVC = MiAntojitosViewController()
    let cestaVC = CestaAntojitosViewController()
   
    
    
    //MARK: Outlets
    @IBOutlet weak var promotionalCodeView: PromotionalCodeView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Functions
    func setupView() {
        promotionalCodeView.setup(presentationController: self)
    }
    
    func setupTabBarController() {
//          inicioVC.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house.fill"), tag: 0)
          promocionesVC.tabBarItem = UITabBarItem(title: "Promociones", image: UIImage(systemName: "eurosign.circle"), tag: 1)
          cartaVC.tabBarItem = UITabBarItem(title: "Carta", image: UIImage(systemName: "doc.plaintext"), tag: 2)
          miAntojitosVC.tabBarItem = UITabBarItem(title: "Mi Antojitos", image: UIImage(systemName: "heart.circle"), tag: 3)
          cestaVC.tabBarItem = UITabBarItem(title: "Cesta", image: UIImage(systemName: "heart.circle"), tag: 4)
          
          let controllers = [ promocionesVC, cartaVC, miAntojitosVC, cestaVC]
          
          antojitosTabBarController.viewControllers = controllers
          
          antojitosTabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
      }

    
    deinit {
        print("    [DEINIT] ->      ANTOJITOSINICIO ViewController")
    }
}

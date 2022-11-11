//
//  TabBarAntojitosViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 11/11/22.
//

import Foundation
import UIKit

final class TabBarAntojitosViewController: UIViewController {
    
    //MARK: Variables
    let tabBarAntojitosController = UITabBarController()
    
    private lazy var inicioViewController: InicioAntojitosViewController = {
        let storyboard = UIStoryboard(name: "InicioAntojitosViewController", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "InicioAntojitosViewController") as? InicioAntojitosViewController else {
            fatalError("IncioAntojitos no localizado")}
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    private lazy var promocionesViewController: PromocionesAntojitosViewController = {
        let storyboard = UIStoryboard(name: "PromocionesAntojitosViewController", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "PromocionesAntojitosViewController") as? PromocionesAntojitosViewController else {
            fatalError("PromocionesAntojitos no localizado")}
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var cartaViewController: CartaAntojitosViewController = {
        let storyboard = UIStoryboard(name: "CartaAntojitosViewController", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "CartaAntojitosViewController") as? CartaAntojitosViewController else {
            fatalError("Carta Antojitos no localizado")}
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    
    let cartaVC = CartaAntojitosViewController()
    let miAntojitosVC = MiAntojitosViewController()
    let cestaVC = CestaAntojitosViewController()
    
    //MARK: Outlets
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    //MARK: Functions
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        viewController.didMove(toParent: self)
    }
    
    func setupTabBarController() {
          inicioViewController.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house.fill"), tag: 0)
          
          promocionesViewController.tabBarItem = UITabBarItem(title: "Promociones", image: UIImage(systemName: "house.fill"), tag: 1)
          cartaViewController.tabBarItem = UITabBarItem(title: "Carta", image: UIImage(systemName: "house.fill"), tag: 2)
        /*
          miAntojitosVC.tabBarItem = UITabBarItem(title: "Mi Antojitos", image: UIImage(systemName: "house.fill"), tag: 3)
          cestaVC.tabBarItem = UITabBarItem(title: "Cesta", image: UIImage(systemName: "house.fill"), tag: 4)
         */
          
          let controllers = [inicioViewController, promocionesViewController, cartaViewController]
          
          tabBarAntojitosController.viewControllers = controllers
          
        tabBarAntojitosController.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
      }
}

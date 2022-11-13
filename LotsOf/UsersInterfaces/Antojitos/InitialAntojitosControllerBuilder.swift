//
//  InitialAntojitosControllerBuilder.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 11/11/22.
//

import Foundation
import UIKit

final class InitialAntojitosControllerBuilder {
    
    func build() -> UIViewController {
        let tabBarAntojitosController = UITabBarController()
        
        let viewControllers =   [
            buildInicio(),
            buildPromociones(),
            buildMiAntojitos(),
            buildCarta(),
            buildCesta()]
        tabBarAntojitosController.setViewControllers(viewControllers, animated: true)
        return tabBarAntojitosController

    }
}

extension InitialAntojitosControllerBuilder {
    func buildInicio() -> UIViewController {
        let viewController = InicioAntojitosViewController.createFromStoryboard()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house.fill"), tag: 0)
        return navigationController
    }
    
    func buildPromociones() -> UIViewController {
        let viewController = PromocionesAntojitosViewController.createFromStoryboard()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Promociones", image: UIImage(systemName:"eurosign.circle"), tag: 1)
        return navigationController
    }
    func buildCarta() -> UIViewController {
        let viewController = CartaAntojitosViewController.createFromStoryboard()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Carta", image: UIImage(systemName:"square.circle"), tag: 1)
        return navigationController
        
    }
    func buildMiAntojitos() -> UIViewController {
        let viewController = MiAntojitosViewController.createFromStoryboard()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Mi Antojitos", image: UIImage(systemName: "heart.circle"), tag: 1)
        return navigationController
        
    }
    
    func buildCesta() -> UIViewController {
        let viewController =  CestaAntojitosViewController.createFromStoryboard()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Cesta", image: UIImage(systemName: "bag.circle"), tag: 1)
        return navigationController
    }
     
}

extension UIViewController {
    static func createFromStoryboard() -> Self {
        return UIStoryboard(name: String(describing: self), bundle: .main).instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}

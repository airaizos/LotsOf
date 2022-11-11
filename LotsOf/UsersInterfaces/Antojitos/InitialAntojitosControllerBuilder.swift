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
        
        let viewControllers = [buildInicio()]
        tabBarAntojitosController.setViewControllers(viewControllers, animated: true)
        return tabBarAntojitosController
    }
    
}

extension InitialAntojitosControllerBuilder {
    func buildInicio() -> UINavigationController {
        let viewController = UIStoryboard(name: "InicioAntojitosViewController", bundle: .main).instantiateViewController(withIdentifier: "InicioAntojitosViewController") as! InicioAntojitosViewController
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house.fill"), tag: 0)
        return navigationController
    }
}

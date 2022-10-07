//
//  ViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import UIKit
import LoginModule

final class URLSessionsViewController: UIViewController {
    
    @IBOutlet weak var busLines: UIButton!
    
    @IBOutlet weak var pokemonsButton: UIButton!
    
    @IBOutlet weak var rickAndMortyButton: UIButton!
    
    @IBOutlet weak var emmanuelButton: UIButton!
    
    
    @IBOutlet weak var odenzaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: BusLines
    @IBAction func goToLines(_ sender: UIButton) {
        goTo(viewControllerName: "LinesViewController")
    }
    //MARK: Pokemons
    @IBAction func goToPokemons(_ sender: UIButton) {
        goTo(viewControllerName: "PokemonsViewController")
    }
    
    //MARK: RickAndMorty
    
    @IBAction func goToRickAndMorty(_ sender: UIButton) {
        
        goTo(viewControllerName: "RickAndMortyViewController")
    }
    //MARK: Emmanuel
    @IBAction func goToEmmanuel(_ sender: UIButton) {
        goTo(viewControllerName: "EmmanuelViewController")
    }
    //MARK: Odenza
    @IBAction func goToOdenza(_ sender: UIButton) {
        goTo(viewControllerName: "OdenzaViewController")
    }
    
    @IBAction func goToJokes(_ sender: UIButton) {
        
        goTo(viewControllerName: "JokesViewController")
    }

    @IBAction func goToDogs(_ sender: UIButton) {
        let viewController = DogViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func goToLogin(_ sender: UIButton) {
        let module = LoginModule()
        let storyboard = module.getModuleStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
        
    
    
    @IBAction func goToColors(_ sender: UIButton) {
        goTo(viewControllerName: "ColorsListViewController")
    }
    
    
    @IBAction func goToUsers(_ sender: UIButton) {
        
        goTo(viewControllerName: "UsersCollectionViewController")
    }
    
    @IBAction func gotoPostPPS(_ sender: UIButton) {
        goTo(viewControllerName: "PostPPSViewController")
        
    }
    
    
}

extension UIViewController {
    func goTo(viewControllerName: String){
        let storyboard = UIStoryboard(name: viewControllerName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        print("goTo\(viewControllerName)")
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}


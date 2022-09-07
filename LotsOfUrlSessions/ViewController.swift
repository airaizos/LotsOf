//
//  ViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    func goTo(viewControllerName: String){
        let storyboard = UIStoryboard(name: viewControllerName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        print("goTo\(viewControllerName)")
        self.present(viewController, animated: true)
    }
}


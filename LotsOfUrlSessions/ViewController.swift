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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: BusLines
    @IBAction func goToLines(_ sender: UIButton) {
        busLines.addTarget(self, action: #selector(goToLinesViewController(_:)), for: .touchUpInside)
    }
    @objc private func goToLinesViewController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "LinesViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LinesViewController")
        self.present(viewController, animated: true)
        print("Pulsado Lines")
    }
    //MARK: Pokemons
    @IBAction func goToPokemons(_ sender: UIButton) {
        pokemonsButton.addTarget(self, action: #selector(goToPokemonsViewController(_:)), for: .touchUpInside)
    }
    @objc private func goToPokemonsViewController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "PokemonsViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PokemonsViewController")
        self.present(viewController, animated: true)
        print("pulsado Pokemons")
    }
    
    //MARK: RickAndMorty
    
    @IBAction func goToRickAndMorty(_ sender: UIButton) {
        rickAndMortyButton.addTarget(self, action: #selector(goToRickAndMortyViewController(_:)), for: .touchUpInside)
    }
    
    @objc private func goToRickAndMortyViewController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "RickAndMortyViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RickAndMortyViewController")
        self.present(viewController, animated: true)
        print("Pulsado RickAndMorty")
    }
    
}


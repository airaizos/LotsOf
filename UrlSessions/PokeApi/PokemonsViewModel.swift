//
//  PokemonsViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
// https://pokeapi.co

import Foundation

final class PokemonsViewModel {
    
    var refreshData = { () -> () in }
    var pokemons: [PokemonDataModel] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getPokemons() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=5")
        
        URLSession.shared.dataTask(with: url!) { data, response,error in
            if let _ = error {
                print("Error")
            }
            if let data = data, let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                
                self.pokemons = pokemonDataModel.pokemons.reversed()
                print("\(self.pokemons[0].name.uppercased())")
                
            }
        }.resume()
    }
    
    func getFetch(at index: Int) -> PokemonDataModel {
        let item = pokemons[index]
        return item
    }
}

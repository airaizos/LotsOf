//
//  Model.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
// https://pokeapi.co

import Foundation

struct PokemonDataModel: Decodable {
    let name: String
    let url: String
}

//MARK: De aqui es donde se toma para el Decoder
struct PokemonResponseDataModel: Decodable {
    let pokemons: [PokemonDataModel]
    
    enum CondingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CondingKeys.self)
        self .pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}

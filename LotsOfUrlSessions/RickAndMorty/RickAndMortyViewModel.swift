//
//  RickAndMortyViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
// https://rickandmortyapi.com/documentation

import Foundation

final class RickAndMortyViewModel {
    func executeRequest() {
        let characterURL = URL(string: "https://rickandmortyapi.com/api/character/1")!
        
        URLSession.shared.dataTask(with: characterURL) { data, response, error in
            if let _ = error {
                print("Error URL Session")
            }
            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let characterModel = try! JSONDecoder().decode(CharacterModel.self, from: data)
                print("\(characterModel.name)")
            }
        }.resume()
    }
}


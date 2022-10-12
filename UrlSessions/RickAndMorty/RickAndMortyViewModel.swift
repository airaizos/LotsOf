//
//  RickAndMortyViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
// https://rickandmortyapi.com/documentation

import Foundation

final class RickAndMortyViewModel {
    var refreshData = { () -> () in }
    
    var characterBasicInfo: CharacterBasicInfo = .empty {
        didSet {
            refreshData()
        }
    }
  
    func executeRequest() {
        let randomNumber = Int.random(in: 1..<100)
        let characterURL = URL(string: "https://rickandmortyapi.com/api/character/\(randomNumber)")!
        
        //Primera Llamada
        URLSession.shared.dataTask(with: characterURL) { data, response, error in
            if let _ = error {
                print("Error URL Session")
            }
            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let characterModel = try! JSONDecoder().decode(CharacterModel.self, from: data)
                print("\(characterModel.name)")
                
                //Segunda llamada
                let firstEpisodeURL = URL(string: characterModel.episode.first!)!
                
                URLSession.shared.dataTask(with: firstEpisodeURL) { data, response, error in
                    if let _ = error {
                        print("Error firstEpisodeURL")
                    }
                    if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                        let episodeModel = try! JSONDecoder().decode(EpisodeModel.self, from: data)
                        print("\(episodeModel.name)")
                        
                        //Tercera llamada
                        guard let characterLocationURL = URL(string: characterModel.locationURL) else { return }
                        
                        URLSession.shared.dataTask(with: characterLocationURL) { data, response, error in
                            if let _ = error {
                                print("Error Character LocationURL")
                            }
                            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                                let locationModel = try!  JSONDecoder().decode(LocationModel.self, from: data)
                                print("\(locationModel.dimension)")
                                
                                DispatchQueue.main.async {
                                    self.characterBasicInfo = .init(name: characterModel.name, image: characterModel.image, firstEpisodeTitle: episodeModel.name, dimension: locationModel.dimension)
                                }
                            }
                        }.resume()
                    }
                }.resume()
            }
        }.resume()
    }
}

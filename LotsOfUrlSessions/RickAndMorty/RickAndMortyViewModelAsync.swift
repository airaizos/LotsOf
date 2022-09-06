//
//  RickAndMortyViewModelAsync.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/9/22.
//

import Foundation

final class RickAndMortyViewModelAsync {
    var characterBasicInfo: CharacterBasicInfo = .empty
    
    func executeRequest() async {
        let characterURL = URL(string: "https://rickandmortyapi.com/api/character/5")!
        if #available(iOS 15.0, *) {
            
            let (data, _) = try! await URLSession.shared.data(from: characterURL)
            
            let characterModel = try! JSONDecoder().decode(CharacterModel.self, from: data)
            
            let firstEpisodeURL = URL(string: characterModel.episode.first!)!
            let (dataFirstEpisode, _) = try! await URLSession.shared.data(from: firstEpisodeURL)
            let episodeModel = try! JSONDecoder().decode(EpisodeModel.self, from: dataFirstEpisode)
            
            let characterLocationURL = URL(string: characterModel.locationURL)!
            let (dataLocation, _) = try! await URLSession.shared.data(from: characterLocationURL)
            let locationModel = try! JSONDecoder().decode(LocationModel.self, from: dataLocation)
            
            self.characterBasicInfo = .init(name: characterModel.name, image: characterModel.image, firstEpisodeTitle: episodeModel.name, dimension: locationModel.dimension)
            
        } else {
            func executeRequest() async {
                let characterURL = URL(string: "https://rickandmortyapi.com/api/character/5")!
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
                                let characterLocationURL = URL(string: characterModel.locationURL)!
                                
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
    }
}

//
//  JokesViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import Foundation

final class JokesViewModel {
    var joke: JokeModel = .empty
    var randomType = true
    
    func fetchJoke() {
       
        let type = randomType ? "Programming" : "Dark"
        
        let url = URL(string: "https://v2.jokeapi.dev/joke/\(type)?type=single")
        
        guard let url = url else { return }
        randomType = !randomType
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                print("Joke Error")
            } else {
                if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    let jokeModel = try! JSONDecoder().decode(JokeModel.self, from: data)
                    print(jokeModel)
                    
                    DispatchQueue.main.async {
                        self.joke = jokeModel
                    }
                }
            }
        }.resume()
    }
}

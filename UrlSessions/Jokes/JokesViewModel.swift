//
//  JokesViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import Foundation

final class JokesViewModel {
    var joke: JokeModel = .empty
    
    func fetchJoke(with parameters: String) {
       
        let url = URL(string: parameters)
        
        guard let url = url else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                print("Joke Error")
            } else {
                if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    let jokeModel = try! JSONDecoder().decode(JokeModel.self, from: data)
                    print("Decoded Joke:\(jokeModel)")
                    
                    DispatchQueue.main.async {
                        self.joke = jokeModel
                    }
                }
            }
        }.resume()
    }
}

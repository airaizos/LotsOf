//
//  JokeNetworking.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import Foundation

struct JokeNetworking {
    var urlSession = URLSession.shared
    var jokeModel: JokeModel = .empty
    
    mutating func sendRequest(
    to url: URL,
    then handler: @escaping(Result<JokeModel,Error>) -> Void) {
        
        /*
        let task = urlSession.dataTask(with: url) { data, response, error in
            if let _ = error {
                print("Joke Error")
            } else {
                
                if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    let jokeModel = try! JSONDecoder().decode(Joke.self, from: data)
                    print(jokeModel)
                    
                    DispatchQueue.main.async {
                        self.jokeModel = jokeModel
                    }
                }
                
            }
        }
        
    }
         */
}
}

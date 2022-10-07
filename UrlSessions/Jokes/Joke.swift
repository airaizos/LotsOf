//
//  Joke.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import Foundation

struct JokeModel: Decodable {
    static var empty: Self {
        .init(category: "", joke: "", setup: "", delivery: "")
    }
    
    let category: String?
    let joke: String?
    let setup: String?
    let delivery: String?
    
    
    var jokeCategory: String {
        return category ?? "No category"
    }
    var jokeComposition: String {
            return joke ?? "\(setup ?? "")\n\(delivery ?? "")"
    }
}

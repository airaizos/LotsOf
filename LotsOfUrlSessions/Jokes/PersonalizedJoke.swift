//
//  PersonalizedJoke.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 9/9/22.
//

import Foundation


final class PersonalizedJoke {
    
    var url = ""
    
    var urlCategory = ""
    
   
    
    init(urlCategory: String) {
        self.urlCategory = urlCategory
    }
    var personalizeJokeURL = "https://v2.jokeapi.dev/joke/CATEGORY"
    
    
}

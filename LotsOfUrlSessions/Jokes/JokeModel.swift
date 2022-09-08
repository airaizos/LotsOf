//
//  JokeModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import Foundation

struct JokeModel: Decodable {
    let error: String
    let category: String
    let type: String
    let joke: String
    let flags: Flags
    let id: Int
    let lang: String
}


struct Flags: Decodable {
    let nsfw, religious, political, racist,sexist, explicit: Bool
}
/*
 
 https://v2.jokeapi.dev/joke/Programming,Dark?lang=es
 
 {
     "error": false,
     "category": "Programming",
     "type": "single",
     "joke": "Sólo hay 10 tipos de personas en este mundo, las que entienden binario y las que no.",
     "flags": {
         "nsfw": false,
         "religious": false,
         "political": false,
         "racist": false,
         "sexist": false,
         "explicit": false
     },
     "safe": true,
     "id": 5,
     "lang": "es"
 }
 */

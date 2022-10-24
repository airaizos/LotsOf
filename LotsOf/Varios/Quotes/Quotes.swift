//
//  Quotes.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 23/10/22.
//

import Foundation


struct Quote: Codable {
    let text: String
    let author: String
}

extension Quote {
    
    func getQuote(from text: String) -> String {
        guard let separator = text.lastIndex(of: "/") else { return "." }
        let quote = String(text[separator...])
        return quote
    }
    
    
    func getAuthor(from text: String) -> String {
        guard let separator = text.firstIndex(of: "/") else { return "." }
        let author =  String(text[...separator])
        return author
    }
}


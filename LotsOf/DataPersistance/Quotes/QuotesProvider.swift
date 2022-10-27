//
//  QuotesProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 23/10/22.


import Foundation

final class QuotesProvider {
    var quotes = [String]()
    
    func getRandomQuote() -> Quote {
        guard let stringQuote = quotes.randomElement() else { return Quote(text: "", author: "") }
        let text = stringQuote.textBeforeDashSeparator
        let author = stringQuote.textAfterDashSeparator
        
        return Quote(text: text, author: author)
    }
    
    func getQuotes() {
        if let info = Bundle.main.object(forInfoDictionaryKey: "quotes") as? [String] {
            let quotes = info.map { $0 }
            self.quotes = quotes
        }
    }
    func getQuote(from text: String) -> String {
        guard let separator = text.lastIndex(of: "/") else { return "." }
        let quote = String(text[...separator].dropLast())
        return quote
    }
    
    
    func getAuthor(from text: String) -> String {
        guard let separator = text.firstIndex(of: "/") else { return "." }
        let author =  String(text[separator...].dropFirst())
        return author
    }
    
    func getQuotesOne() {
        let decoder = PropertyListDecoder()
        
        if let url = Bundle.main.url(forResource: "InfoplistQuotes", withExtension: "plist") {
            
            if let data = try? Data(contentsOf: url) {
                if let quotes = try? decoder.decode([String].self, from: data) {
                    self.quotes = quotes
                    print("Quote: \(quotes[0])")
                }
            }
            
        }
        print("No data")
    }
}

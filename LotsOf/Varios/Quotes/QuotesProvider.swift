//
//  QuotesProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 23/10/22.


import Foundation

final class QuotesProvider {
    var quotes = [String]()
    
    func getQuotes() {
        if let info = Bundle.main.object(forInfoDictionaryKey: "quotes") as? [String] {
            let quotes = info.map { $0 }
            self.quotes = quotes
        }
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

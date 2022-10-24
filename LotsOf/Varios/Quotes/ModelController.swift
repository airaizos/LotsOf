//
//  ModelController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 23/10/22.
//

import Foundation

final class ModelController {
    let provider = QuotesProvider()
    
    var quote = Quote(text: "", author: "")
    
    func getQuote() {
        if quote.text == "" {
            quote = provider.getRandomQuote()
        }
    }
}



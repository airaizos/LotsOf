//
//  PromotionalCodeViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 28/10/22.
//

import Foundation

final class PromotionalCodeViewModel {
    let userCode: String? = nil
    var validCodes = [String]()
    let isCodeValid = false
    
    init() {
        getPromotionalCodes()
    }
    
    func getPromotionalCodes() {
        guard let filePath = Bundle.main.path(forResource: "promotionalCodes", ofType: "json") else { fatalError("no jsonPromotionalCodes")}
        
        guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else {fatalError("Can't parse json")}
        let jsonData = json.data(using: .utf8)!
        let promotionalCodes = try!JSONDecoder().decode(PromotionalCodes.self, from: jsonData)
        self.validCodes = promotionalCodes.codes
    }
    
    func validateUserCode(from text: String) -> Bool {
        if validCodes.contains(text) {
            return true
        }
        return false
    }
}

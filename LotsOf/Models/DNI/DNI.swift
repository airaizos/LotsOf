//
//  DNI.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 27/11/22.
//

import Foundation


struct DNI: Equatable {
    let rawText: String
    var id: String? {
        if !isValidRawText { return nil }
        return "\(rawText)\(controlLetter!)"
    }
    
    var isValidRawText: Bool {
        if rawText.count != 8 {
            return false
        }
        
        let totalInts = rawText.compactMap({ Int(String($0)) })
        if totalInts.count != 8 {
            return false
        }
        return true
    }
    
    
    var controlLetter: Character? {
        if !isValidRawText { return nil }
        
        let rawDni = rawText.compactMap { Int(String($0)) }
        
        let value = rawDni.reduce(0,{ x,y in x + y })
        let remainder = value % 23
        
        switch remainder {
        case 0: return "T"
        case 1: return "R"
        case 2: return "W"
        case 3: return "A"
        case 4: return "G"
        case 5: return "M"
        case 6: return "Y"
        case 7: return "F"
        case 8: return "P"
        case 9: return "D"
        case 10: return "X"
        case 11: return "B"
        case 12: return "N"
        case 13: return "J"
        case 14: return "Z"
        case 15: return "S"
        case 16: return "Q"
        case 17: return "V"
        case 18: return "H"
        case 19: return "L"
        case 20: return "C"
        case 21: return "K"
        case 22: return "E"
        default: return "-"
        }
    }
}

//
//  ISBN.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 27/11/22.
// ISBN-13: 978-1-86197-876-9
//978-8-41811-803-6
//978-0-14196-969-5 : 13

import Foundation


/// ISBN 13 dígitos. Modulo 10
struct ISBN {
    let info: String
    
    var isValidInfo: Bool {
   //     let rawInfo = info.replacingOccurrences(of: "-", with: "")
        var rawText = info
        let removeCharacters: Set<Character> = ["I","S","B","N",":","-"," "]
        rawText.removeAll { removeCharacters.contains($0) }
       
        if rawText.count != 12 {
            return false
        }
        return true
    }
    
    var controlDigit: Int? {
        let allDigits = info.compactMap( { Int(String($0)) } )
        var isTriples = false
      
        let values = allDigits.map ({ value in
            if isTriples {
                isTriples.toggle()
                return value * 3
            } else {
                isTriples.toggle()
                return value
            }
        })
    
        var result = values.reduce(0, { x,y in x + y } )
        result = result % 10
        result = 10 - result
        
        return result
    }
    
    var id: String? {
        if !isValidInfo {  return nil }
        guard let validControlDigit = controlDigit else { return nil }
        
        if info.hasSuffix("-") {
            return "\(info)\(validControlDigit)"
        } else {
            return "\(info)-\(validControlDigit)"
        }
    }
    
    
}

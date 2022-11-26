//
//  ICC.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 26/11/22.
//

import Foundation


/// Digito de Control generado a partir de algoritmo de Luhn base 10
struct ICC: Equatable {
    
    let rawText: String
    var id: String? {
        if !isValidRawText { return nil }
        return "\(rawText)\(controlDigit ?? 0)"
        
    }
    var controlDigit: Int? {
        if !isValidRawText { return nil }
        
        var rawIcc = rawText.compactMap( { Int(String($0)) })
        
       
        rawIcc.append(0)
        var isByTwo = false
        let valueDigits = rawIcc.reversed().map { digit in
            if isByTwo {
                isByTwo.toggle()
                if (digit * 2) > 9 {
                    return (digit * 2) - 9
                } else {
                    return (digit * 2)
                }
            }
            isByTwo.toggle()
            return digit
        }
        
        var result = valueDigits.reduce(0, { x,y in x + y})
        result *= 9
        result = result % 1000
        result = result % 100
        result = result % 10
        return result
    }
    
    var isValidRawText: Bool {
        if rawText.count != 18 { return false }
        
        let totalInts = rawText.compactMap { Int(String($0))}
        
        if totalInts.count != 18 { return false }
        return true
    }
}

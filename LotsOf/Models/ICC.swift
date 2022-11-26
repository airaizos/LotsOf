//
//  ICC.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 26/11/22.
//

import Foundation


struct ICC: Equatable {
    
    let rawText: String
    var id: String? {
        if !isValidRawText { return nil }
        
        var rawIcc = rawText.compactMap( { Int(String($0)) })
        rawIcc.append(0)
        var isByTwo = false
        var valueDigits = rawIcc.reversed().map { digit in
            if isByTwo {
                isByTwo.toggle()
                return (digit * 2)
        }
            isByTwo.toggle()
            return digit
        }
        var result = valueDigits.reduce(0, { x,y in x + y})
        
        result = result % 1000
        result = result % 100
        result = result % 10
        
        // residuo 1000, 100 10
        }
        
        /*
         
         
         hacer un array de ints
         añadir un 0 al final
         hacer un array de indices que multiplican x2
         iterar con los indices en el array de ints multiplicando y
         
         
         
        */
        
        
        return "s"
    }
    
    var controlDigit: Int {
        5
    }
    
    var isValidRawText: Bool {
        if rawText.count != 18 { return false }
        
        let totalInts = rawText.compactMap { Int(String($0))}
        
        if totalInts.count != 18 { return false }
        return true
    }
}

//
//  IMEI.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 27/11/22.
// Comenzando desde la derecha, doblar un dígitos cada dos dígitos. Sumar los dígitos. Revisar si la suma es divisible por 10.

import Foundation


/// Digito de Control generado a partir de algoritmo de Luhn base 10
struct IMEI: Equatable {
    
    let rawText: String
    var isValidRawText: Bool {
        if rawText.count != 14 { return false }
        let totalInts = rawText.compactMap({ Int(String($0))})
        if totalInts.count != 14 { return false }
        return true
    }
    var controlDigit: Int? {
        if !isValidRawText {  return nil }
        var allDigits = rawText.reversed().compactMap({ Int(String($0)) })
        allDigits.insert(0,at: 0)
        var isDouble = false
        let values = allDigits.map({ digit in
            if isDouble {
                isDouble.toggle()
                let valueDoubled = digit * 2
                if valueDoubled > 9 {
                    return valueDoubled - 9
                } else {
                    return valueDoubled
                }
            } else {
                isDouble.toggle()
                return digit
            }
        })
        
        var result = values.reduce(0,{ x,y in x + y })
        
        result *= 9
        result = result % 1000
        result = result % 100
        result = result % 10

        return result
    }
    
    var id: String? {
        if !isValidRawText { return nil }
        guard let validControlDigit = controlDigit else { return nil }
        return "\(rawText)\(validControlDigit)"
    }
}

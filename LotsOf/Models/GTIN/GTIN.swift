//
//  GTIN.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 28/11/22.
//

import Foundation


struct GTIN {
    let info: String
    
    var isValidInfo: Bool {
        if info.count != 12 { return false }
        let allDigits = info.compactMap ({ Int(String($0)) })
        if allDigits.count != 12 { return false }
        
        return true
    }
    
    var controlDigit: Int? {
        if !isValidInfo { return nil }
        var isEven = true
        
        let allValues: [Int] = info.compactMap({ digit in
            guard let value = Int(String(digit)) else { return 0 }
            if isEven {
                isEven.toggle()
                return value
            } else {
                isEven.toggle()
                return value * 3
            }
        })

        var result = allValues.reduce(0,+)
        let divisor = ((result / 10) + 1) * 10
       
        result = divisor - result
        return result
    }
    var id: String? {
        guard let validControlDigit = controlDigit else { return nil }
        
        switch isValidInfo {
        case false: return nil
        case true: return "\(info)\(validControlDigit)"
        }
    }
    
}

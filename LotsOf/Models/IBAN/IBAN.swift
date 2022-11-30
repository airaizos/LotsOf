//
//  IBAN.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 29/11/22.
//ES 98 2038 5778 98 3000760236

import Foundation

struct IBAN {
    
    var country: String
    var bank: String
    var office: String
    var account: String
    
    var dc: String?
    var ibanDC: String?
    
    var isValid: Bool {
        if country != "ES" { return false }
        if bank.count != 4 && Int(bank)! < 0 && Int(bank)! > 9999 { return false }
        if office.count != 4 && Int(office)! < 0 && Int(office)! > 9999 { return false }
        
        if account.count != 10 && Int(account) == nil {
            return false
        }
        return true
    }
    
}

//
//  INSS.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 29/11/22.
//
/*
 Provincia 2 digitos
 Número secuencial: 7 u 8 digitos
 Digitos de control: 02
 */

import Foundation


struct INSS {
    
    let provincia: Int
    let numeroTrabajador: String
    
    var isValidProvinciaNumber: Bool {
        if provincia > 50 || provincia < 01 {
            return false
        }
        
        if numeroTrabajador.count > 8 ||  numeroTrabajador.count < 7 {
            return false
        }
        
        guard let _ = Int(String(numeroTrabajador)) else { return false }
        
       return true
    }
    
    var controlDigit: String? {
        if !isValidProvinciaNumber { return nil }
        
        guard let value = Int(numeroTrabajador) else { return nil }
   
        
        var result = 0
        if value < 10_000_000 {
         //numeroTrabajador + provincia * 10 millones
            result = value + (provincia * 10_000_000)
            
            
        } else {
            //concatenar provincia + numeroTrabjaador
            result =  Int(String("\(provincia)\(value)")) ?? 0
            
        }
        let digits = result % 97
        
        let stringDigits = digits < 10 ? "0\(digits)" : "\(digits)"
       
        return stringDigits
    }
    
    var id: String? {
        if !isValidProvinciaNumber { return nil }
        
        guard let validControlDigit = controlDigit else { return nil }
        return "\(provincia)\(numeroTrabajador)\(validControlDigit)"
    }
}

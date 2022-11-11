//
//  extensionInt.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 31/10/22.
//

import Foundation

extension Int {
    
    /// Añade un cero delante si el Int es menor a 10
    /// - Returns: Devuelve un string con un cero delante si el Int es menor a 10
    func appendZeros() -> String {
        if (self < 10) {
            return "0\(self)"
        } else {
            return "\(self)"
        }
    }
}

//
//  HackerRankAlgoritmos.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 26/10/22.
//

import Foundation

final class HackerRankAlgoritmos {
    
    //No funciona
    func iceCreamParlor(m: Int, arr: [Int]) -> [Int] {
        //6  1 3 4 5 6
        //ordenar menor a mayor
        // remanente m - menor
        // array restante quitar los que  sean mayor o menor al remanente
        //devolver el inicie base 1
        var result = [Int]()
        let arraySorted = arr.sorted()
        for i in arraySorted {
            let primero = m - (m - i)
            let remanente = m - primero
            let segundo = arraySorted.filter { $0 == remanente }.reduce(0, +)
            
            let total = m - primero - segundo
            if (total == 0) {
                let firstIndex = arraySorted.firstIndex(of: primero)! + 1
                let secondIndex = arraySorted.firstIndex(of: segundo)! + 1 
                result.append(firstIndex)
                result.append(secondIndex)
                break
            }
        }
        return result
    }
    
    //MARK: ✅
    func camelcase(s: String) -> Int {
        var count = 1
        
        let uppers = CharacterSet.uppercaseLetters

        s.unicodeScalars.forEach { i in
            if uppers.contains(i) {
                count += 1
            }
        }

        return count
    }
    
}

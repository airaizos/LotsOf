//
//  HackerRankAlgoritmos.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 26/10/22.
//

import Foundation

final class HackerRankAlgoritmos {
    
    //MARK: - 📜 WorkingOn
  
    
    
    //MARK: - ❌ Incorrect
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
    
    func hackerrankInString(s: String) -> String {
        // Write your code here
        let letters = s.compactMap { "\($0)" }
        
        let word = "hackerrank"
        var arrayWord = word.compactMap { "\($0)"
        }
        var letter = arrayWord[0]
        
        letters.forEach {
            if $0 == letter && !arrayWord.isEmpty {
                arrayWord.removeFirst()
                if !arrayWord.isEmpty {
                    letter = arrayWord[0]
                }
            }
        }
        if arrayWord.isEmpty {
            return "YES"
        }
        return "NO"
    }
    
    func pangrams(s: String) -> String {
        //"not pangram" "pangram"
        if s.count < 26 {
            return "not pangram"
        }
        
        let sortedPhrase = s.lowercased().replacingOccurrences(of: " ", with: "").sorted()
        var lastLetter = Character("a")
        var alphabet = ["a"]
        sortedPhrase.forEach { letter in
            if letter != lastLetter {
                alphabet.append("\(letter)")
                lastLetter = letter
            }
        }
        if alphabet.count == 26 {
            return "pangram"
        } else {
            return "not pangram"
        }
    }
}

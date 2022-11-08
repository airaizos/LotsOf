//
//  HackerRankAlgoritmosTest.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 26/10/22.
//

import XCTest

@testable import LotsOfUrlSessions
final class HackerRankAlgoritmosTest: XCTestCase {

    func testIcreamParlor() throws {
        let clase = HackerRankAlgoritmos()
        
        let iceCreamParlor = clase.iceCreamParlor(m: 6, arr:  [1,2,3,4,5,6])
        let iceCreamParlor1 = clase.iceCreamParlor(m: 5, arr: [1,4,5,3,2])
        let iceCreamParlor2 = clase.iceCreamParlor(m: 4, arr: [2,2,4,3])
        
        
        XCTAssertEqual(iceCreamParlor, [1,5])
        XCTAssertEqual(iceCreamParlor1, [1,4])
        XCTAssertEqual(iceCreamParlor2, [1,2])
    }
    
    
    func testCamelcase() throws {
        let clase = HackerRankAlgoritmos()
        
        let camelCase = clase.camelcase(s: "saveChangesInTheEditor")
        let camelCase1 = clase.camelcase(s: "adrianIraizosMendoza")
        
        
        XCTAssertEqual(camelCase, 5)
        XCTAssertEqual(camelCase1, 3)
    }
    

    func testHackerrankInString() throws {
        
        let clase =  HackerRankAlgoritmos()
        
        XCTAssertEqual("YES", clase.hackerrankInString(s: "haacckkerrannkk"))
        XCTAssertEqual("NO", clase.hackerrankInString(s: "haacckkerannk"))
        XCTAssertEqual("NO", clase.hackerrankInString(s: "hccaakkerrannkk"))
        
        XCTAssertEqual("YES", clase.hackerrankInString(s: "hereiamstackerrank"))
        XCTAssertEqual("NO", clase.hackerrankInString(s: "hackerworld"))
    }
    
    
    func testPangrams() throws {
        let clase = HackerRankAlgoritmos()
        
        let phrasePangram = "We promptly judged antique ivory buckles for the next prize"
        let pangram = clase.pangrams(s: phrasePangram)
        
        let phraseNotPangram = "We promptly judged antique ivory buckles for the prize"
        
        let notPangram = clase.pangrams(s: phraseNotPangram)
        let phrasePangram2 = "qmExzBIJmdELxyOFWv LOCmefk TwPhargKSPEqSxzveiun"
        let pangram2 = clase.pangrams(s: phrasePangram2)
        
        XCTAssertEqual("pangram", pangram)
        XCTAssertEqual("not pangram", notPangram)
        XCTAssertEqual("pangram", pangram2)
    }
    
    func testLonelyInteger() throws {
        let clase = HackerRankAlgoritmos()
        
        let answer4 = [1,2,3,4,3,2,1]
        let answer2 = [0,0,1,2,1]
        let answer1 = [1]
       
        
        XCTAssertEqual(4, clase.lonelyinteger(a: answer4))
        XCTAssertEqual(2, clase.lonelyinteger(a: answer2))
        XCTAssertEqual(1, clase.lonelyinteger(a: answer1))
    }
    
    func testIntroTutorial() throws {
        let clase = HackerRankAlgoritmos()
        
        let case1 = clase.introTutorial(V: 4, arr: [1,4,5,7,9,12])
        
        XCTAssertEqual(1, case1)
        
    }
    
}

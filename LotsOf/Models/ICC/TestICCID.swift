//
//  TestICCID.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 26/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestICCID: XCTestCase {
    
    func testIsValidRawText() throws {
        //8934075700022553744
        let sut = ICC(rawText: "893407570002255374")
        XCTAssertTrue(sut.isValidRawText)
    }
    
    func testIsNotValidRawTest() throws {
        
        let sut = ICC(rawText: "893407570002A4ess55375")
        XCTAssertFalse(sut.isValidRawText)
        
        let sutFalse = ICC(rawText: "ABCDEFGHIJKLMNOPQR")
        XCTAssertFalse(sutFalse.isValidRawText)
    }
    
    func testIsCorrectControlDigit() throws {
     
        let sut4 = ICC(rawText: "893407570002255374")
        
        XCTAssertEqual(sut4.controlDigit,4)
        
        let sut7 = ICC(rawText: "893407670003753925")

        XCTAssertEqual(sut7.controlDigit,7)
    }
    
    func testIsCorrectIccId() throws {
        
        let sut = ICC(rawText: "893407570002255374")
        
        XCTAssertEqual(sut.id, "8934075700022553744")
        
        //8934076700037539257
        let sut1 = ICC(rawText: "893407670003753925")
        
        XCTAssertEqual(sut1.id,"8934076700037539257")
    }
}

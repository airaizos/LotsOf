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
        
    }
    
}

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
        //8934075700201007066
        let sut = ICC(rawText: "893407570020100706")
        XCTAssertTrue(sut.isValidRawText)
    }
    
    func testIsNotValidRawTest() throws {
        
        let sut = ICC(rawText: "893407570002A4ess55375")
        XCTAssertFalse(sut.isValidRawText)
        
        let sutFalse = ICC(rawText: "ABCDEFGHIJKLMNOPQR")
        XCTAssertFalse(sutFalse.isValidRawText)
    }
    
    func testIsCorrectControlDigit() throws {
     
        let sut4 = ICC(rawText: "893407570020220131")
        
        XCTAssertEqual(sut4.controlDigit,2)
        
        let sut7 = ICC(rawText: "893407570020220131")

        XCTAssertEqual(sut7.controlDigit,2)
    }
    
    func testIsCorrectIccId() throws {
        
        let sut = ICC(rawText: "893407570020220131")
        
        XCTAssertEqual(sut.id, "8934075700202201312")
        
        
        let sut1 = ICC(rawText: "893407570020100706")
        
        XCTAssertEqual(sut1.id,"8934075700201007066")
    }
}

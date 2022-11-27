//
//  testIMEI.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 27/11/22.
//

import XCTest
@testable import LotsOfUrlSessions
final class testIMEI: XCTestCase {
    
    func testIsValidRawText() throws {
        
        let sut = IMEI(rawText: "12345678901234")
        
        XCTAssertTrue(sut.isValidRawText)
    }
    
    func testNotValidRawText() throws {
        
        let sut = IMEI(rawText: "A1234567890123")
        XCTAssertFalse(sut.isValidRawText)
        
        XCTAssertFalse(IMEI(rawText: "ABCDEFGHIjklmn").isValidRawText)
        
    }
    
    func testCorrectControlDigit() throws {
        
        let sut7 = IMEI(rawText: "12345678901234")
        XCTAssertEqual(sut7.controlDigit,7)
        
        let sut6 = IMEI(rawText: "35145120840121")
        XCTAssertEqual(sut6.controlDigit,6)
    }
    
    func testValidIMEI() throws {
        let sut = IMEI(rawText: "35145120840121")
        XCTAssertEqual(sut.id, "351451208401216")
        
        XCTAssertEqual(IMEI(rawText: "35353535353535").id, "353535353535352")
    }
}


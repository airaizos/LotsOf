//
//  testDNI.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 27/11/22.
//

import XCTest
@testable import LotsOfUrlSessions
final class testDNI: XCTestCase {

    func testIsValidRawText() throws {
        let sut = DNI(rawText: "12345678")
        XCTAssertTrue(sut.isValidRawText)
    }
    
    func testIsNotValidRawText()  throws {
        let sut = DNI(rawText: "AS1234578")
        XCTAssertFalse(sut.isValidRawText)
        let sut1 = DNI(rawText:"ASY3IASEU33")
        XCTAssertFalse(sut1.isValidRawText)
    }
    
    func isValidControlDigit() throws {
        let sut = DNI(rawText: "12345678")
        XCTAssertEqual(sut.controlLetter,"Z")
        
        let sut1 = DNI(rawText:"98765432")
        XCTAssertEqual(sut1.controlLetter,"M")
        let sut2 = DNI(rawText:"000000000")
        XCTAssertEqual(sut2.controlLetter,"T")
    }
    
    func isValidDNIID() throws {
        
        let sut = DNI(rawText: "999999999")
        XCTAssertEqual(sut.id, "99999999R")
        let sut1 = DNI(rawText: "00000001")
        XCTAssertEqual(sut1.id, "000000001R")
    }
}

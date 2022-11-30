//
//  testIBAN.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 29/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class testIBAN: XCTestCase {
    
    func testIsValidCountry () throws {
        let sut = IBAN(country: "ES", bank: "1234", office: "5678", account: "1234567890")
        
        XCTAssertTrue(sut.isValid)
    }
    
    
    func testNoValidCountry()  throws {
        let sut = IBAN(country: "AL", bank: "1234", office: "5678", account: "1234567890")
        XCTAssertFalse(sut.isValid)
    }
    
    func testValidBank() {
        
    }
    
}

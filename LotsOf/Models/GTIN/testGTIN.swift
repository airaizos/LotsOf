//
//  testGTIN.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 28/11/22.
// 845678900000 12 + DC 

import XCTest
@testable import LotsOfUrlSessions

final class testGTIN: XCTestCase {
    
    func testValidInfo() throws {
        let sut = GTIN(info: "845678900000")
        
        XCTAssertTrue(sut.isValidInfo)
    }
    
    func testNoValidInfo() throws {
        let sut = GTIN(info: "AS8456789000")
        
        XCTAssertFalse(sut.isValidInfo)
    }
    
    func testControlDigit() throws {
        
        let sut7 = GTIN(info: "845678900000")
        XCTAssertEqual(sut7.controlDigit,7)
        
        let sut1 = GTIN(info: "841258451254")
        XCTAssertEqual(sut1.controlDigit, 1)
    }
    
    func testValidId() throws {
        let sut = GTIN(info: "830395024769")
        
        XCTAssertEqual(sut.id, "8303950247696")
    }
    
    func testNotValidId() {
        let sut = GTIN(info: "ABCDEFGHIJKL")
        XCTAssertNil(sut.id)
        
       
        XCTAssertNil(GTIN(info: "123456789").id)
        
    }
    
}

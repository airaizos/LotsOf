//
//  testNSS.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 29/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class testNSS: XCTestCase {
    
    func testValidProvinciaAndNumber () throws {
        
        let sut = INSS(provincia: 28, numeroTrabajador: "12345678")
        
        XCTAssertTrue(sut.isValidProvinciaNumber)
        
    }
    
    func testNotValidProvincia() throws {
        let sut = INSS(provincia: 99, numeroTrabajador: "12345678")
        XCTAssertFalse(sut.isValidProvinciaNumber)
    }
    
    func testValidControlDigit() throws {
        
        let sut40 = INSS(provincia: 28, numeroTrabajador: "12345678")
        XCTAssertEqual(sut40.controlDigit, "40")
        
        let sut27 = INSS(provincia: 01, numeroTrabajador: "1234567")
        XCTAssertEqual(sut27.controlDigit, "27")
        
        let sut68 = INSS(provincia: 50, numeroTrabajador: "7654321")
        XCTAssertEqual(sut68.controlDigit, "68")
    }
    
    func testValidId() throws {
        
        let sut1 = INSS(provincia: 28, numeroTrabajador: "12345678")
        XCTAssertEqual(sut1.id, "281234567840")
        
        let sut2 = INSS(provincia: 50, numeroTrabajador: "0000180")
        XCTAssertEqual(sut2.id, "50000018003")
    }
    
}

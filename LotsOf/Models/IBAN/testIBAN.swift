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
    
    func testCorrectDC() throws {
        
        let sut = IBAN(country: "ES", bank: "2038", office: "5778", account: "3000760236")
        
        XCTAssertTrue(sut.isValid)
        
        XCTAssertEqual(sut.controlDigitCalculation(), "98")
        
        let sut80 = IBAN(country: "ES", bank: "9999", office: "8888", account: "7777777777")
        XCTAssertEqual(sut80.controlDigitCalculation(),"80")
      
    }
    
    func testCorrectIBANDc() throws {
      
        
    }
    
    
    func testControlDigit() throws {
        
        
    }
    
    func testCorrectFormatIBANNumber() throws {
        let sut = IBAN(country: "ES", bank: "2038", office: "5778", account: "3000760236",dc: "98",ibanDC: "98")
        
        XCTAssertEqual(sut.number, "ES98-2038-5778-98-3000760236")
    }
    
    func testCorrectElectronicIBAN() throws {
        
        let sut = IBAN(country: "ES", bank: "2038", office: "5778", account: "3000760236",dc: "98",ibanDC: "98")
        
        XCTAssertEqual(sut.electronic, "ES9820385778983000760236")
    }
    
    func testCorrectPrintableIBAN() throws {
        let sut = IBAN(country: "ES", bank: "2038", office: "5778", account: "3000760236",dc: "98",ibanDC: "98")
        
        print(sut.printable)
        print("ES98 2038 5778 9830 0076 0236")
        XCTAssertEqual(sut.printable, "ES98 2038 5778 9830 0076 0236")
    }
}

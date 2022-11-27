//
//  testISBN.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 27/11/22.
//

import XCTest
@testable import LotsOfUrlSessions
final class testISBN: XCTestCase {
    
    func testValidInfo() throws {
        let sut = ISBN(info: "978-1-86197-876")
        XCTAssertTrue(sut.isValidInfo)
        
        let sutISBN = ISBN(info: "ISBN 978-1-86197-876")
        XCTAssertTrue(sutISBN.isValidInfo)
        
        let sutInts = ISBN(info: "978186197876")
        XCTAssertTrue(sutInts.isValidInfo)
    }
    
    func testControlDigit() throws {
        
        let sut9 = ISBN(info: "978186197876")
        
        XCTAssertEqual(sut9.controlDigit,9)
        
        let sut6 = ISBN(info: "ISBN: 978-8-41811-803")
        XCTAssertEqual(sut6.controlDigit,6)
        
        let sut5 = ISBN(info: "978-0-14196-969-")
        XCTAssertEqual(sut5.controlDigit,5)
    }
    
    func testValidID() throws {
        let sutISBN = ISBN(info:"ISBN:978-1-86197-876-")
        XCTAssertEqual(sutISBN.id,"ISBN:978-1-86197-876-9")
        
        let sut6 = ISBN(info:"978-8-41811-803")
        XCTAssertEqual(sut6.id,"978-8-41811-803-6")
        
        let sut5 = ISBN(info:"978-0-14196-969-")
        XCTAssertEqual(sut5.id,"978-0-14196-969-5")
        
    }
}

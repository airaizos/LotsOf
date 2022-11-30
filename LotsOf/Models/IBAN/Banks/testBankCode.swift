//
//  testBankCode.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 30/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class testBankCode: XCTestCase {
    
    func testIsFetchingJson() throws {
        let sut = BankProvider()
        
        sut.fetch()
        
        XCTAssertNotNil(sut.banks)
        XCTAssertEqual(sut.banks[0].name, "ABANCA CORPORACION BANCARIA")
        
    }
    
}

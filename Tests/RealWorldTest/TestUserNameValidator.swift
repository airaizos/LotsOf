//
//  TestUserNameValidator.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 15/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestUserNameValidator: XCTestCase {
    func testTooShortname() {
        let sut = UsernameValidator()
        let result = sut.isValid("U1")
        
        XCTAssertFalse(result)
    }

    func testTooShortUsername() {
        XCTAssertFalse(UsernameValidator().isValid("U2"))
    }
    
}

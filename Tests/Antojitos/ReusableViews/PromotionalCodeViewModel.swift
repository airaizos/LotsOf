//
//  PromotionalCodeViewModel.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 28/10/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestPromotionalCodeViewModel: XCTestCase {
    
    func testGetPromotionalCode() throws {
        let promotional = PromotionalCodeViewModel()
        promotional.getPromotionalCodes()
        
        XCTAssertEqual("charcheroso", promotional.validCodes[0])
    }
    
    func testValidateUserCode() throws {
        
        let promotional = PromotionalCodeViewModel()
        
        promotional.getPromotionalCodes()
        let testValidateUserCodeFalse = promotional.validateUserCode(from: "A")
        let testValidateUserCodeTrue = promotional.validateUserCode(from: "charcheroso")
        
        XCTAssertTrue(testValidateUserCodeTrue)
        XCTAssertFalse(testValidateUserCodeFalse)
        
    }
    
}

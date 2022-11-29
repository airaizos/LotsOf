//
//  TestWorldCupViewModel.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 18/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestWorldCupViewModel: XCTestCase {

    func testCanGetMatches() throws {
  
        
    }
    
    func testCanGetGroups() throws {
        let sut = WorldCupViewModel()
        sut.getGroups()
        
        XCTAssertNotNil(sut.groups)
        
        
    }
}

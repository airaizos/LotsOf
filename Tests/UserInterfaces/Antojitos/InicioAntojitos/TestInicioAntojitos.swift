//
//  TestInicioAntojitos.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 13/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestInicioAntojitos: XCTestCase {
    
    func testCanParseExclusivePromos() {
       let sut = ExclusivesPromosViewModel()
        
        sut.fetchItems()
        
     XCTAssertEqual(sut.exclusivePromos[0].title, "Mini Bandeja Paisa")
        
        XCTAssertEqual(sut.exclusivePromos.count, 5)
    }
}

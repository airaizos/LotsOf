//
//  TestQatarWorldCup2022.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 15/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestQatarWorldCup2022: XCTestCase {

    func testCanDecodeJson() throws {
        let sut = QatarGroupsProvider()
        
        sut.fetchWorldCupGroups()
        
        XCTAssertEqual(sut.worldCupGroups?.groupA.count,4)
        XCTAssertEqual(sut.worldCupGroups?.groupA[0].name,"Qatar")
    }

}

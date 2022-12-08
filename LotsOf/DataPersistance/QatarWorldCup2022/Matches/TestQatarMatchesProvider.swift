//
//  TestQatarMatchesProvider.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 8/12/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestQatarMatchesProvider: XCTestCase {
    
    
    func testCanParse() throws {
        let sut = QatarMatchesProvider()
        
        let json = """
[{"MatchNumber":1,"RoundNumber":1,"DateUtc":"2022-11-20 16:00:00Z","Location":"Al Bayt Stadium","HomeTeam":"Qatar","AwayTeam":"Ecuador","Group":"Group A","HomeTeamScore":0,"AwayTeamScore":2},{"MatchNumber":3,"RoundNumber":1,"DateUtc":"2022-11-21 13:00:00Z","Location":"Khalifa International Stadium","HomeTeam":"England","AwayTeam":"Iran","Group":"Group B","HomeTeamScore":6,"AwayTeamScore":2},{"MatchNumber":2,"RoundNumber":1,"DateUtc":"2022-11-21 16:00:00Z","Location":"Al Thumama Stadium","HomeTeam":"Senegal","AwayTeam":"Netherlands","Group":"Group A","HomeTeamScore":0,"AwayTeamScore":2}]
"""
        
        let matches = sut.parse(data: json.data(using: .utf8), error: ProviderError.noDecoding)
        var match : WorldCupMatch!
        
        switch matches {
        case .success(let partidos):
           match = partidos[0]
        case .failure(let error): print(error)
        }
        
        XCTAssertNotNil(matches)
        XCTAssertEqual(match.location, "Al Bayt Stadium")
        
    }
    
}

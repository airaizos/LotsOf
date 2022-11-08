//
//  ChampionsLeagueTests.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 4/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class ChampionsLeagueTests: XCTestCase {

    
    func testInitialValues() throws {
        let viewModel = ChampionsLeagueViewModel()
        
        XCTAssertTrue(viewModel.teams.count == 32)
      
        
    }
    func testTeamsGroupsRaffle() throws {
        let viewModel = ChampionsLeagueViewModel()
        
        viewModel.teamsGroupsRaffle()
        
        XCTAssertEqual(4, viewModel.groupA.count)
        XCTAssertEqual(4, viewModel.groupB.count)
        XCTAssertEqual(4, viewModel.groupC.count)
        XCTAssertEqual(4, viewModel.groupD.count)
        XCTAssertEqual(4, viewModel.groupE.count)
        XCTAssertEqual(4, viewModel.groupF.count)
        XCTAssertEqual(4, viewModel.groupG.count)
        XCTAssertEqual(4, viewModel.groupH.count)
    }

    func testMatchesToPlay() throws {
        let viewModel = ChampionsLeagueViewModel()
        viewModel.teamsGroupsRaffle()
        
        
        viewModel.matchesToPlay(for: viewModel.groupA)
        XCTAssertEqual(viewModel.matches.count, 12)
        
        viewModel.matchesToPlay(for: viewModel.groupB)
        XCTAssertEqual(viewModel.matches.count, 24)
    }
    
}

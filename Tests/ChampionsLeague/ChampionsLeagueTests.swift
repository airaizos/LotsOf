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
        
        XCTAssertEqual(4, viewModel.getGroupACount())
        XCTAssertEqual(4, viewModel.getGroupBCount())
        XCTAssertEqual(4, viewModel.getGroupCCount())
        XCTAssertEqual(4, viewModel.getGroupDCount())
        XCTAssertEqual(4, viewModel.getGroupECount())
        XCTAssertEqual(4, viewModel.getGroupFCount())
        XCTAssertEqual(4, viewModel.getGroupGCount())
        XCTAssertEqual(4, viewModel.getGroupHCount())
    }
/*
    func testMatchesToPlay() throws {
        let viewModel = ChampionsLeagueViewModel()
        viewModel.teamsGroupsRaffle()
        
        
        viewModel.matchesToPlay(for: viewModel.groupA)
        XCTAssertEqual(viewModel.matches.count, 12)
        
        viewModel.matchesToPlay(for: viewModel.groupB)
        XCTAssertEqual(viewModel.matches.count, 24)
    }
    */
}

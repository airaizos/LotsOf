//
//  WorldCupViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/11/22.
//

import Foundation

final class WorldCupViewModel {
    //MARK: Variables
    var refreshData = { () -> () in }
    
    var groupsProvider = QatarGroupsProvider()
    var matchesProvider = QatarMatchesProvider()
    
    var groups: WorldCupGroups? {
        didSet {
            refreshData()
        }
    }
    var matches = [WorldCupMatch]() {
        didSet {
            refreshData()
        }
    }
    
    
    //MARK: Functions
    func getMatches() {
        matchesProvider.fetchMatches({ result in
            switch result {
            case .success(let success):
                self.matches = success
                print("MATCHES: \(self.matches)")
            case .failure(let error):
                LogManager.shared.log("WorldCupViewModel: \(error.localizedDescription)")
            }
        })
    }
    
    func getGroups() {
        groupsProvider.fetchWorldCupGroups()
        groups = groupsProvider.worldCupGroups
    }
    
  
    
}

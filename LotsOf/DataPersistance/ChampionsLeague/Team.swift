//
//  Team.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 4/11/22.
//

import Foundation

enum LetterGroups {
    case A,B,C,D,E,F,G,H
    
}

struct Team: Equatable {
    let name: String
    let group: LetterGroups?
    
    var played: Int {
        won + lost + draws
    }
    var won: Int = 0
    var lost: Int = 0
    var draws: Int = 0
    var points: Int {
        won * 3 + draws
    }
    
    var goalsFor: Int = 0
    var goalsAgainst: Int = 0
    var goalsDifference: Int {
        goalsFor - goalsAgainst
    }
    var qualified: Bool = false
    
}

struct Match {
    var home: Team
    var visitor: Team
    var homeGoals: Int = 0
    var visitorGoals: Int = 0
}

struct Groups {
    var teams: [Team]
}

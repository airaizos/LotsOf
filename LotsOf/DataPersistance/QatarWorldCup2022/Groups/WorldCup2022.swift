//
//  WorldCup.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/11/22.
// https://fixturedownload.com/feed/json/fifa-world-cup-2022

import Foundation

struct WorldCup2022: Decodable {
    let title: String
    let logoWorldCup2022: String
    let groups: WorldCupGroups
    
    enum CodingKeys: String, CodingKey {
        case title, groups
        case logoWorldCup2022 = "logo-world-cup-2022"
    }
}

struct WorldCupGroups: Decodable {
    let groupA, groupB, groupC, groupD, groupE, groupF, groupG, groupH: [WorldCupTeam]
    
    enum CodingKeys: String, CodingKey {
        case groupA = "Group A"
        case groupB = "Group B"
        case groupC = "Group C"
        case groupD = "Group D"
        case groupE = "Group E"
        case groupF = "Group F"
        case groupG = "Group G"
        case groupH = "Group H"
    }
}


struct WorldCupTeam: Decodable {
    let name: String
    let logo:String
    let link: String
}


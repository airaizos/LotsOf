//
//  QatarWorldCupProtocols.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 21/11/22.
//

import Foundation


protocol QatarWorldCupMatchesProvider {
    func fetchMatches(_ completion: @escaping (Result<[WorldCupMatch],Error>) -> Void)
}

protocol QatarWorldCupGroupsProvider {
    func fetchWorldCupGroups()
}

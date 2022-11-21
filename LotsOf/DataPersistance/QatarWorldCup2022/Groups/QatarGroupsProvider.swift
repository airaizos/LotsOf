//
//  QatarGroupsProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/11/22.
//

import Foundation



final class QatarGroupsProvider: QatarWorldCupGroupsProvider {
    
    var worldCupGroups: WorldCupGroups?
    
    func fetchWorldCupGroups() {
        guard let filePath = Bundle.main.path(forResource: "QatarWorldCupGroups", ofType: "json") else {
            LogManager.shared.log("QatarWorldCup:  \(ProviderError.badFilePath)")
            return
        }
        
        guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else {
            LogManager.shared.log("QatarWorldCup: \(ProviderError.noEncoding)")
            return
        }
        
        do {
            let jsonData = json.data(using: .utf8)!
            let worldCup2022 = try JSONDecoder().decode(WorldCup2022.self, from: jsonData)
            self.worldCupGroups = worldCup2022.groups
            
        } catch {
            LogManager.shared.log("QatarWorldCup: \(ProviderError.noDecoding)")
        }
    }
}

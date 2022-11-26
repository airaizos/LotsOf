//
//  DataPersistenceLocalProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 24/11/22.
//

import Foundation


final class DataPersistenceLocalProvider: DataPersistenceProvider {
    var apps = [appInfo]()
    
    func fetch() {
        guard let filePath = Bundle.main.path(forResource: "DataPersistenceJson", ofType: "json") else { LogManager.shared.log("DataPersistence:\(ProviderError.badFilePath)")
            return
            
        }
        
        guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else {
            LogManager.shared.log("DataPersistence:\(ProviderError.noDecoding)")
            return
        }
        
        do {
            let jsonData = json.data(using: .utf8)!
            let appsInfo = try JSONDecoder().decode([appInfo].self, from: jsonData)
            
            self.apps = appsInfo
        } catch {
            LogManager.shared.log("DataPersistence: \(ProviderError.noDecoding)")
        }
    }
}


protocol DataPersistenceProvider {
    var apps: [appInfo] { get set }
    func fetch()
}

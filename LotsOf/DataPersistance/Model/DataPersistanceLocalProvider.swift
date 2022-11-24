//
//  DataPersistanceLocalProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 24/11/22.
//

import Foundation


final class DataPersistanceLocalProvider: DataPersistanceProvider {
    var apps = [appInfo]()
    
    func fetch() {
        guard let filePath = Bundle.main.path(forResource: "DataPersistanceJson", ofType: "json") else { LogManager.shared.log("DataPersistance:\(ProviderError.badFilePath)")
            return
            
        }
        
        guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else {
            LogManager.shared.log("DataPersistance:\(ProviderError.noDecoding)")
            return
        }
        
        do {
            let jsonData = json.data(using: .utf8)!
            let appsInfo = try JSONDecoder().decode([appInfo].self, from: jsonData)
            
            self.apps = appsInfo
        } catch {
            LogManager.shared.log("DataPersistance: \(ProviderError.noDecoding)")
        }
    }
}


protocol DataPersistanceProvider {
    var apps: [appInfo] { get set }
    func fetch()
}

//
//  DataPersistenceViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 24/11/22.
//

import UIKit


final class DataPersistenceViewModel {
    
    var apps = [AppInfo]()
    
    let provider = DataPersistenceLocalProvider()
    
    func getInfo() {
        provider.fetch()
        
        apps = provider.apps
    }
    
    func didSelectItem(at indexPath: IndexPath) -> AppInfo {
        let item = apps[indexPath.row]
        return item
    }
    
    
    
    
}



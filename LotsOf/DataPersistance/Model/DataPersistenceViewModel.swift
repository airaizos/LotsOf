//
//  DataPersistenceViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 24/11/22.
//

import UIKit


final class DataPersistenceViewModel {
    
    let provider = DataPersistenceLocalProvider()
    
    func getInfo() {
        provider.fetch()
    }
    
    
    
    
}



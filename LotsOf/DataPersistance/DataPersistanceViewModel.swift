//
//  DataPersistanceViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 24/11/22.
//

import Foundation


final class DataPersistanceViewModel {
    
    var dataPersistanceViews = [
            appInfo(name: "Enum", detail: "User Defaults", viewController: "EnumUserDefaultViewController"),
            appInfo(name: "Moure Dev", detail: "User Defaults", viewController: "MourdevUserDefaultsViewController"),
            appInfo(name: "TrincoJobs", detail: "CoreData", viewController: "OfertaListViewController"),
            appInfo(name: "Quotes", detail: "InfopList", viewController: "QuotesViewController"),
            appInfo(name: "Qatar World Cup", detail: "Core Data", viewController: "QatarGroupsViewController")
    
            
            ]
    
}



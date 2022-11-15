//
//  ExclusivesPromosViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/11/22.
//

import Foundation

final class ExclusivesPromosViewModel {
    
    //MARK: Variables
    private var exclusivesPromosProvider = ExclusivesPromosJsonProvider()
    
    var refreshData = { () -> () in }
    var exclusivePromos = [ExclusivePromo]() {
        didSet {
            refreshData()
        }
    }
    
    //MARK: Functions
    func fetchItems() {
                guard let filePath = Bundle.main.path(forResource: "exclusivePromos", ofType: "json") else { fatalError() }
                
                guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else {fatalError("")}
                
        do {
            let jsonData = json.data(using: .utf8)!
            let antojitosPromos = try JSONDecoder().decode(AntojitosPromos.self, from: jsonData)
            exclusivePromos = antojitosPromos.promos
        } catch let error {
            LogManager.shared.log("ExclusivePromo \(error.localizedDescription)")
        }
        
                    
    }
    
    // No provee los datos
    func getItems() {
        exclusivesPromosProvider.fetchItems { result in
            switch result {
            case .success(let exclusivePromos): self.exclusivePromos = exclusivePromos
            case .failure(let error):
                LogManager.shared.log("ExclusivePromosViewModel getItems failure \(error.localizedDescription)")
            }
        }
    }
    
    func getNumberItems() -> Int {
        exclusivePromos.count
    }
    
    
    func getItem(at index: Int) -> ExclusivePromo {
        let item = exclusivePromos[index]
        return item
    }
    
    func didSelectItem(at indexPath: IndexPath) -> ExclusivePromo {
        let item = exclusivePromos[indexPath.row]
        return item
    }
    
}



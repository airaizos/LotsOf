//
//  ExclusivesPromosJsonProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/11/22.
//

import Foundation

//TODO: Porque no pasa a getItems
final class ExclusivesPromosJsonProvider {
    
    func fetchItems(_ completion: @escaping(Result<[ExclusivePromo],Error>) -> Void) {
        
        guard let filePath = Bundle.main.path(forResource: "exclusivePromos", ofType: "json") else { fatalError() }
        
        guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else {fatalError("")}
        
        do {
            let jsonData = json.data(using: .utf8)!
            let antojitosPromos = try JSONDecoder().decode(AntojitosPromos.self, from: jsonData)
            DispatchQueue.main.async {
                completion(.success(antojitosPromos.promos))
            }
        } catch let error {
            LogManager.shared.log("ExclusivePromo \(error.localizedDescription)")
        }
    }
}

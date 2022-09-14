//
//  ColorsNetworking.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/9/22.
//

import Foundation

final class ColorsNetworking {
    
 //   var result: ColorsResult = .empty
  //  var output: [ColorModel] = [.empty]
    
    let url = "https://reqres.in/api/unknown"
    
    func fetchColors(_ completion: @escaping (Result<[ColorModel],Error>) ->Void) {
        guard let url = URL(string: url) else { return }
        
       URLSession.shared.dataTask(with: url) { data, response,error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let requestData = try decoder.decode(ColorsResult.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(requestData.data))
                    print(requestData.data[0])
                }
                
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                print("Colors URLSession Error ")
            }
        }.resume()
        
    }
}

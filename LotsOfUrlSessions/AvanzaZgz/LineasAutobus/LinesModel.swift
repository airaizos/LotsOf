//
//  LineasModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import Foundation

enum ProviderError: Error {
    case badUrl, noConection
}

final class LinesModel {
    
    var lines: [BusLine]?
    
    func fetchLines(_ completion: @escaping(Result<[BusLine],ProviderError>)-> Void) {
        guard let url = URL(string: "https://www.zaragoza.es/sede/servicio/urbanismo-infraestructuras/transporte-urbano/linea-autobus.json") else {  return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data  else { return }
            do {
                let decoder = JSONDecoder()
                let requestData = try decoder.decode(Lines.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(requestData.result))
                }
            }
            catch let error {
                print("\(error) URLSession")
            }
        }.resume()
    }
}

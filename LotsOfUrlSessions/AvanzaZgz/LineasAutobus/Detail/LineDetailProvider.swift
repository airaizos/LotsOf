//
//  LineDetailProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 19/9/22.
// http://www.zaragoza.es/sede/servicio/urbanismo-infraestructuras/transporte-urbano/linea-autobus/N6

import Foundation

final class LineDetailProvider {
    var lineModel: LineModel?
 
    private let baseUrl = "http://www.zaragoza.es/sede/servicio/urbanismo-infraestructuras/transporte-urbano/linea-autobus/"
    
    func fetchBusLine(number: String, _ completion: @escaping(Result<LineModel,Error>) -> Void)  {
        guard let url = URL(string: "\(baseUrl)\(number).json") else { return }
        print("URL Completa: \(url)")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    let lineModelResult = try JSONDecoder().decode(LineModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(lineModelResult))
                        print("URLSession lineModelResult\(lineModelResult.title)")
                    }
                } catch let error {
                    print(error)
                    print("\(error.localizedDescription)")
                }
            }
        }.resume()
    }
}



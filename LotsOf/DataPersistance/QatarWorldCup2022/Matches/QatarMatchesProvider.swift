//
//  QatarMatchesProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 17/11/22.
// https://fixturedownload.com/feed/json/fifa-world-cup-2022

import Foundation

final class QatarMatchesProvider: QatarWorldCupMatchesProvider {
    
    var worldCupMatches = [WorldCupMatch]()
    
    func fetchMatches(_ completion: @escaping (Result<[WorldCupMatch],Error>) -> Void) {
        guard let url = URL(string: "https://fixturedownload.com/feed/json/fifa-world-cup-2022") else { return }

            
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(self.parse(data: data, error: error))
            }
        } .resume()
    }
    
    func parse(data: Data?, error: Error?) -> Result<[WorldCupMatch],Error> {
        if let data = data { return
            Result { try JSONDecoder().decode([WorldCupMatch].self, from: data) }
        } else {
            return .failure(error ?? ProviderError.noConection)
        }
        
    }
    
}

protocol HTTPClient {
    func execute(request: URLRequest, completion: @escaping(Result<Data,Error>) -> Void)
}

class RealHTTPClient: HTTPClient {
    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data =  data {
                    completion(.success(data))
                } else {
                    completion(.failure(error!))
                }
            }
        }.resume()
    }
}

class MockHTTPClient: HTTPClient {
    var inputRequest: URLRequest?
    var executeCalled = false
    var result:  Result<Data,Error>?
    
    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        executeCalled = true
        inputRequest = request
        result.map(completion)
    }
}

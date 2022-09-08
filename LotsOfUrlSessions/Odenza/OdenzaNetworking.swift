//
//  OdenzaNetworking.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import Foundation

struct OdenzaNetworking {
    var urlSession = URLSession.shared
    
    func sendPostRequest(
        to url: URL,
        body: Data,
        then handler: @escaping (Result<Data,Error>) -> Void
    ) {
        var request = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalCacheData
        )
        request.httpMethod = "POST"
        request.httpBody = body
        
        let task = urlSession.dataTask(
            with: request, completionHandler: {
                data, response, error in
            }
        )
        task.resume()
    }
}

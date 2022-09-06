//
//  EmmanuelViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/9/22.
// https://jsonplaceholder.typicode.com/posts

import Foundation

final class EmmanuelViewModel {
    
    var emmanuelPosts: [EmmanuelModel] = []
    
    func fetchPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                print("Error urlSession")
            } else {
                if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
    
                    let postDataModel = try! JSONDecoder().decode([EmmanuelModel].self, from: data)
                    self.emmanuelPosts = postDataModel
                    print("\(self.emmanuelPosts[0])")
                }
            }
        }.resume()
    }
}

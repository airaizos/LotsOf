//
//  EmmanuelViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/9/22.
// https://jsonplaceholder.typicode.com/posts

import Foundation

final class EmmanuelViewModel {
    //MARK: POST
    
    func postPosts() {
        let firstPost = [
            "title": "Macco is the best",
            "body": "This is the body of the post."
        ]
        
        guard let dataPost = try? JSONSerialization.data(withJSONObject: firstPost, options: []) else { return }
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = dataPost
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if let _ = error {
                print("Error POST")
            } else {
                let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response \(String(describing: jsonResponse))")
            }
        }.resume()
    }
    
    //MARK: GET
    var emmanuelPosts: [EmmanuelModel] = []
    func fetchPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                print("Error urlSession")
            } else {
                if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    
                    let postDataModel = try! JSONDecoder().decode([EmmanuelModel].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.emmanuelPosts = postDataModel
                        print("\(self.emmanuelPosts[0])")
                    }
                }
            }
        }.resume()
    }
    
    
    
    
    func titleButton() -> String {
        print(emmanuelPosts.count)
        return "4"
    }
}

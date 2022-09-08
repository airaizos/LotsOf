//
//  OdenzaViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//

import Foundation

final class OdenzaViewModel {
    var items: [PostModel] = []
    var odenzaNetworking = OdenzaNetworking()
    //MARK: retrive data
    func retrievePosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let task =  URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                guard error == nil, let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    let model = try JSONDecoder().decode([PostModel].self, from: data)
                    DispatchQueue.main.async {
                        self.items = model
                    }
                    
                } catch {
                    print("ParsingError")
                }
            }
            
        }
        task.resume()
    }
    //MARK: Create Data
    func createPosts(parameters: [String: Any]) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("BAd URL")
            return
        }
        let createdData = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = createdData
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, result, error) in
            
            if error != nil {
                print("Error POST")
                return
            } else if
                let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: []) {
                print("Response: \(String(describing: jsonResponse))")
                
            } else {
                print("POST No data")
                
            }
        }.resume()
    }
    
    //MARK: Update data
    func updatePosts(parameters: [String:Any]) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            print("Update URL not found")
            return
        }
        let updatedData = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = updatedData
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, result, error) in
            if error != nil {
                print("UPDATE error")
                return
                
            } else {
                let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("UPDATE Response: \(String(describing: jsonResponse))")
            }
        }.resume()
    }
    
    //MARK: Delete Data
    func deletePosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            print("Error URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, result, error) in
            if error != nil {
                print("DELETE error")
                return
            } else {
                let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("DELETE Response: \(String(describing: jsonResponse))")
            }
        }.resume()
    }
    
    //Odenza Networking
    
    func createData()-> Data {
        
        let parameters = ["title": "titulo", "body": "cuerpo"]
        let createdData = try! JSONSerialization.data(withJSONObject: parameters)
        return createdData
    }

}

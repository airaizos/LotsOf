//
//  OdenzaViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//

import Foundation

final class OdenzaViewModel {
    var items: [PostModel] = []
    
    //MARK: retrive data
 
    
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
    func deletePosts(parameters: [String: Any]) {
        guard let url = URL(string: "/deletePosts") else {
            print("Error URL")
            return
        }
        let deletedData = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = deletedData
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, result, error) in
            if error != nil {
                print("DELETE error")
                return
            } else {
                let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("UPDATE Response: \(String(describing: jsonResponse))")
            }
            
            
        }.resume()
        
    }
    
}

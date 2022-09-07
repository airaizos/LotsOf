//
//  OdenzaViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//

import Foundation

final class OdenzaViewModel {
    var items = [PostModel]()
    
    //MARK: retrive data
    func fetchPosts() {
        guard let url = URL(string: "posts") else {
            print("URL not Found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("URLSession error")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(OdenzaDataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No data")
                }
            } catch let jsonError {
                print("fetch json error. \(jsonError.localizedDescription)")
            }
        }.resume()
    }
    
    
    //MARK: Create Data
    
    func createPosts(parameters: [String: Any]) {
        guard let url = URL(string: "/createPost") else {
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
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(OdenzaDataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("POST No data")
                }
            } catch let jsonError {
                print("fetch JsonError \(jsonError.localizedDescription)")
            }
        }.resume()
    }
    
    //MARK: Update data
    
    func updatePosts(parameters: [String:Any]) {
        guard let url = URL(string: "/url") else {
            print("Update URL not found")
            return
        }
        let updatedData = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = updatedData
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, result, error) in
            if error != nil {
                print("UPDATE error")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(OdenzaDataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("UPDATE error")
                }
            } catch {
                print("UPDATE JsonError")
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
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(OdenzaDataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("DELETE No dataa")
                }
            } catch {
                print("DELETE error JSON")
            }
        } .resume()
        
    }
    
}

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
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                print("Error url Session")
            } else {
                if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    
                    let postDataModel = try! JSONDecoder().decode([PostModel].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.items = postDataModel
                    }
                }
            }
        }.resume()
    }
        
        /*
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("\(String(describing: error))")
            print("\(String(describing: data))")
            print("\(String(describing: response))")
            
            if let _ = error {
                print("URLSession error")
            } else {
                if let data = data {
                    let postDataModel = try! JSONDecoder().decode(OdenzaDataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = postDataModel.data
                        print("\(self.items[0].id)")
                    }
                }
                
            }
        }.resume()
    }
         */
    
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
        }.resume()
        
    }
    
}

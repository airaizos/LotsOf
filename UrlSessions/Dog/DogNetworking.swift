//
//  DogNetworking.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 12/9/22.
// https://api.thedogapi.com/v1/images/search

import Foundation

final class DogNetworking {
    var dogs = [Dog(id: "", url: "", width: 0, height: 0)] {
        didSet {
            refreshData()
        }
    }
    var refreshData = { () -> () in }
    
    func executeRequestedDog() {
     let url = "https://api.thedogapi.com/v1/images/search"
        
        guard let url = URL(string:url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                
                if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    
                    let dogModel = try! JSONDecoder().decode([Dog].self, from: data)
                    print("DogModel: Decoded")
                    
                    DispatchQueue.main.async {
                        self.dogs = dogModel
                        print("H:\(self.dogs[0].height ?? 0 )\nW:\(self.dogs[0].width ?? 0)")
                    }
                }
            }
        }.resume()
    }
}

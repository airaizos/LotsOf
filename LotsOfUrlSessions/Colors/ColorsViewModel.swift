//
//  ColorsViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/9/22.
//

import Foundation


final class ColorsViewModel {
    
    var networking = ColorsNetworking()
    
    var colorsLists: [ColorModel] = []
    /*
    func getColorsList() {
        networking.fetchColors { result in
            switch result {
            case .success:
                self.colorsLists =   self.networking.result.colors
                print(self.colorsLists)
            case .failure: self.colorsLists = [ColorModel(id: 0, name: "Error", year: 0, color: "Error", pantoneValue: "Error")]
            }
        }
    }
    */
    
    func fetchColors () {
        
        let url =  "https://reqres.in/api/unknown"
        
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print("error 1")
            }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let requestData = try decoder.decode(ColorsResult.self, from: data)
                
                DispatchQueue.main.async {
                    self.colorsLists = requestData.data
                    print(self.colorsLists[0])
                }
            } catch let error {
                print("2: \(error.localizedDescription)")
                print(error)
            }
        }
        task.resume()
    }
    
    
    func getColor(at index: Int) -> ColorModel {
        let item = colorsLists[index]
        return item
    }
    

}

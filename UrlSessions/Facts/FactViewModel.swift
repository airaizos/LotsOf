//
//  FactViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 11/10/22.
//

import Foundation


final class FactViewModel {
    // mediante una closure se mantiene actualizado
    //Mecanismo para enlazar la vista con este modelo de vista
    var refreshData = { () -> () in  }
    
    //Fuente de datos Array
    var fact: FactModel? {
        didSet {
            dataArray.append(fact ?? FactModel(id: "", text: "Text", source: ""))
        }
    }
    
    var dataArray: [FactModel] = [] {
        didSet {
            
            //Cuando recarguemos el array , setea la closure
            refreshData()
            print(dataArray)
        }
    }
    
    func addFactToFacts() {
        guard let fact = fact else { return }
        dataArray.append(fact)
    }
    
    //Capa de conexión
    
    //Obtener los datos de la api
    func fetchFact() {
        guard let url = URL(string: "https://uselessfacts.jsph.pl/random.json?language=en") else { return }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            guard let json = data else { return }
            //serializar los datos
            do {
                let decoder = JSONDecoder()
                self.fact = try decoder.decode(FactModel.self, from: json)
            } catch let error {
                print("error: \(error)")
            }
        }.resume()
      
    }
}

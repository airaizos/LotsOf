//
//  LinesViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import Foundation

final class LinesViewModel {
    let model = LinesProvider()
    
    var busLines = [String]()
    
    func getLines() {
        
        model.fetchLines({ result in
            switch result {
            case .success(let lineas):
                self.busLines = lineas.result
            case .failure:
                self.busLines = ["No se ha podido descargar"]
            }
        })
    }
    
    func cellViewModel(at IndexPath: IndexPath) -> String {
        let busLine = busLines[IndexPath.row]
        return busLine
    }
}

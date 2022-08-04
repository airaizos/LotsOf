//
//  LinesViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import Foundation

final class LinesViewModel {
    let model = LinesModel()
    
    func getLines() -> [String] {
        var lines = ["Sin Datos"]
        
        model.fetchLines({ result in
            switch result {
            case .success(let lineas):
                lines = lineas
            case .failure:
                lines = ["No se ha podido descargar"]
            }
        })
        return lines
        
    }
}

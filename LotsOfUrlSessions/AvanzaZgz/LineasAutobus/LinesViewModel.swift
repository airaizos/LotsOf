//
//  LinesViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import Foundation

final class LinesViewModel {
    let model = LinesModel()
    
    private var busLines = [BusLine]()
    
    func getLines() -> [BusLine] {
        var lines = [BusLine]()
        
        model.fetchLines({ result in
            switch result {
            case .success(let lineas):
                lines = lineas
            case .failure:
                lines = [BusLine(link:"No se ha podido descargar")]
            }
        })
        busLines = lines
        return lines
    }
    
    func cellViewModel(at IndexPath: IndexPath) -> BusLineCellViewModel {
        let busLine = busLines[IndexPath.row]
        return busLine.toCellViewModel
    }
}

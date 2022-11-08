//
//  LinesViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import Foundation
import UIKit

final class LinesViewModel {
    
    //MARK: - Variables
    var refreshData = { () -> () in }
    let model = LinesProvider()
    weak var delegate: APIClientDelegate?
    var busLines = [String]() {
        didSet {
            refreshData()
        }
    }
    
    //MARK: - Functions
    func cellViewModel(at IndexPath: IndexPath) -> String {
        let busLine = busLines[IndexPath.row]
        return busLine
    }
    
    func didSelectItem(at indexPath: IndexPath) -> String {
        let item = busLines[indexPath.row]
        return item
    }
}
    //MARK: Extensions
extension LinesViewModel: APIClientDelegate {

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
}

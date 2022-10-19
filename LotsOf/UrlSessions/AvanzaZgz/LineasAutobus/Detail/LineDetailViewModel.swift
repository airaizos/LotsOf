//
//  LineDetailViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 19/9/22.
//

import Foundation
import UIKit

final class LineDetailViewModel {
    var refreshData = { () -> () in }
    
    
    let lineDetailProvider = LineDetailProvider()
    var lineNumber: String?
    var lineDetail: LineModel? {
        didSet {
            refreshData()
        }
    }
    
    func build(with lineNumber: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "LineDetailViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LineDetailViewController")
      
       fetchDetail(busLineNumber: lineNumber)
        
        return viewController
    }
    
    func setCustomTitle() -> String {
        "Título personalizado"
    }
    
    func didPressFavorite() -> Bool {
        false
    }
    
    func fetchDetail(busLineNumber: String) {
        
        lineDetailProvider.fetchBusLine(number: busLineNumber) { result in
            switch result {
            case .success(let lineDetail):
                self.lineDetail = lineDetail
            case .failure:
                self.lineDetail = LineModel(title: "ERROR")
                
                // LineModel(title: "ERROR", result: [GeometryModel(geometry: Geometry(type: "error", coordinates: [[99.99,99.99]]))])
            }
        }
    }
    
}

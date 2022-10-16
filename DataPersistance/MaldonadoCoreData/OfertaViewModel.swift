//
//  OfertaViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 16/10/22.
//

import Foundation

final class OfertaViewModel {
    
    
    
    
    func saveData(item: OfertaModel) {
        OfertaModelo.shared.saveData(oferta: item)
    }
    
}

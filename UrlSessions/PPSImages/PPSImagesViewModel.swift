//
//  PPSImagesViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 10/10/22.
//

import UIKit
import Combine

final class PPSImagesViewModel {
    
    var subscribers = Set<AnyCancellable>()
    var imagesPPS: [FotoUUID] = []
    
    
    var imagePublishers: [AnyPublisher<FotoUUID,URLError>] {
        PPSCollection().images.map {
            getImagePublisher(url: $0)
        }
    }
    
    //Crear un constructor de imágenes
    private func getImagePublisher(url: URL) -> AnyPublisher<FotoUUID, URLError> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap { UIImage(data: $0) }
            .map { FotoUUID(image: $0) }
            
            .eraseToAnyPublisher()
    }
    
    func getImages() {
        Publishers.MergeMany(imagePublishers)
            .collect() // esperará a tener todas y genera un array
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Error en la descarga: \(error)")
                }
            } receiveValue: { fotosRecuperadas in
                self.imagesPPS = fotosRecuperadas
                print("\(self.imagesPPS.count) fotos recuperadas")
            }
            .store(in: &subscribers)
    }
    
    
}


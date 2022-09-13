//
//  DogViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 12/9/22.
//

import Foundation



final class DogViewModel {
    let networking = DogNetworking()
    
    var dog: Dog {
             networking.dogs[0]
    }
    
    //MARK: Labels
   
}

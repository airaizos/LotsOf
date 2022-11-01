//
//  CountDownBox.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 31/10/22.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> ()
    
    //MARK: variables
    var value: T {
        didSet {
            listener?(value)
            
        }
    }
    
    var listener: Listener?
    //MARK: inits
    
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: Functions
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func removeBinding() {
        self.listener = nil
    }
}

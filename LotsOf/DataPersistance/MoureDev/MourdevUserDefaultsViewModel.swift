//
//  MourdevUserDefaultsViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
//

import Foundation

final class MourdevUserDefaultsViewModel {
    
    private let myKey = "THE_KEY"
    private let userDefaults = UserDefaults.standard
    var message = ""
    
    //Guardar datos
    func save(text: String) {
        userDefaults.set(text, forKey: myKey)
        userDefaults.synchronize()
        message = "SAVED"
    }
    
    //Leer datos
    func getText() -> String {
        if let value = userDefaults.string(forKey: myKey) {
            message = "GET"
            return value
        } else {
            message = "NOTHING TO GET"
            return ""
        }
    }
    
    //Borrar datos
    func deleteText() {
        userDefaults.removeObject(forKey: myKey)
        userDefaults.synchronize()
        message = "DELETED"
    }
}

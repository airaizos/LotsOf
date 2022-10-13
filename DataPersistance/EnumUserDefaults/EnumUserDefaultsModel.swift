//
//  EnumUserDefaultsModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
//

import Foundation
//2 categorías de enums

enum ColorPreference {
    case light, dark, system
}
//Para guardar los enums en UserDefaults tiene que conformarce con el protocolo Codable
enum Role: Codable {
    case guest
    case member(String?)
}

final class EnumUserDefaultsModel {
    let userDefaults = UserDefaults.standard
    
    //Write
    
    func writeRoleMember() {
        if let data = try? JSONEncoder().encode(Role.member("Adrianberto")) {
            userDefaults.set(
                data, forKey: "role")
        }
    }
    
    //Read
    func readRoleMember() {
        if let savedData = userDefaults.data(forKey: "role") {
            let role = try? JSONDecoder().decode(Role.self, from: savedData)
            print(savedData)
        }
       
    }
}

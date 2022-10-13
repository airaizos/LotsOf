//
//  EnumUserDefaultsModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
// https://sarunw.com/posts/how-to-save-enum-associated-value-in-userdefaults-using-swift/

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
    
    func writeRoleMember() -> String {
        guard let data = try? JSONEncoder().encode(Role.member("Adrianberto"))  else { return "No Data" }
        userDefaults.set(
            data, forKey: "role")
        return String("\(data)")
    }
    
    //Read
    func readRoleMember() -> String {
        guard let savedData = userDefaults.data(forKey: "role") else { return "No Data" }
        let role = try? JSONDecoder().decode(Role.self, from: savedData)
        return "Saved"
        
    }
}

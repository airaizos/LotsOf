//
//  UserNameValidator.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/11/22.
//

import Foundation

struct UsernameValidator {
    func isValid(_ username: String) -> Bool {
        return username.count > 4
    }
}

struct User {
    let name: String
}



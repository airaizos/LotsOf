//
//  LoginViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/9/22.
//

import Foundation

enum LoginStatus {
    case success, error
}

final class LoginViewModel {
    var loginStatus: LoginStatus = .error
    var didUpdateLoginStatus = false
    
    func loginWith(email: String, password: String) {
        if email.lowercased() == "email@google.com" {
            loginStatus = .success
        } else {
            
            loginStatus = .error
        }
        
        didUpdateLoginStatus = true
    }
    
    func signUp(email: String, password: String) {
        print("Registrarse...")
    }
    func recoverPassword(email: String) {
        print("Recuperar Contraseña")
    }
    
}

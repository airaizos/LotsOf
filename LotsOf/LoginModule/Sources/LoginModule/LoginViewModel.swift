//
//  LoginViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/9/22.
//

import Foundation


public enum LoginStatus {
    case success, error
}

final public class LoginViewModel {
    var networking = LoginNetworking()
    
    public lazy var loginStatus: LoginStatus = .error {
        didSet {
            DispatchQueue.main.async {
                if self.networking.authenticated {
                    self.loginStatus = .success
                } else {
                    self.loginStatus = .error
                }
            }
        }
    }
    public var didUpdateLoginStatus = false
    
    public func loginWith(email: String, password: String) {
        networking.signInRequest(email: email, password: password)
        if networking.authenticated {
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

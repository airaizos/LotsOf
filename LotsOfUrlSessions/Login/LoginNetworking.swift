//
//  LoginNetworking.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/9/22.
// eve.holt@reqres.in
// cityslicka

import Foundation

final public class LoginNetworking {
    var login: LoginModel = LoginModel(token: "", error: "")
    public var authenticated = false
    let url = "https://reqres.in/api/login"
    
    
    public func signInRequest(email: String, password: String) {
        guard let url = URL(string:url)  else { return }
        let parameters = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else { return }
                
                do {
                    let loginData = try JSONDecoder().decode(LoginModel.self, from: data)
                    if loginData.token != nil {
                        DispatchQueue.main.async {
                            self.authenticated = true
                            print("Autenticado con token: \(String(describing: loginData.token))")
                        }
                    }
                } catch let error as NSError {
                    print("error\(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.authenticated = false
                        print("Error en la autenticación")
                }
            }
        }.resume()
    }
}

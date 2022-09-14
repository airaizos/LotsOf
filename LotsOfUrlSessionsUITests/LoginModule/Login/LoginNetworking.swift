//
//  LoginNetworking.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/9/22.
//

import Foundation

final public class LoginNetworking {
   var login: LoginModel
   public var authenticated = false
    let url = "https://reqres.in/api/login"
    
    
    public func signInRequest(email: String, password: String) {
        guard let url = url  else { return }
        let parameters = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url, body: body,
            cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: TimeInterval = 30 )
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data  { return }
                
                do {
                    let loginData = try JSONDecoder().decode(LoginModel.self, from: data)
                    if !loginData.login.token?.isEmpty {
                        DispatchQueue.main.async {
                            self.authenticated = true
                            print("Autenticado con token: \(loginData.login.token)")
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

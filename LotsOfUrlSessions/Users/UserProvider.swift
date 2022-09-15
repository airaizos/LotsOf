//
//  UserProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/9/22.
//

import Foundation

final class UserProvider {
    //  var userResult = UserResult()
    
    func fetchUsers(_ completion: @escaping(Result<[UserModel],Error>) -> Void) {
        guard let url = URL(string: "https://reqres.in/api/users?page=2&per_page=6") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            
            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                
                //  if let weakSelf = self {
                do {
                    let usersResultModel = try JSONDecoder().decode(UserResult.self, from: data)
                    DispatchQueue.main.async {
                        
                        completion(.success(usersResultModel.data))
                        //   weakSelf.users = usersModel
                        //    print("weakSelf.users: \(weakSelf.users)\n")
                        //   print("weakSelf.users: \(usersModel)")
                    }
                } catch let error {
                    print("UserError: \(error.localizedDescription)")
                }
                
            }
        }).resume()
    }
}

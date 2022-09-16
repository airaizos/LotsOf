//
//  UserViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/9/22.
//

import Foundation

final class UserViewModel {
    var userProvider = UserProvider()
    var users = [UserModel]() {
        didSet {
            print("DidSet: \(users)")
        }
    }
    
    func fetchUsers() {
        userProvider.fetchUsers { result in
            switch result {
            case .success(let users):
                self.users.append(UserModel(id: 99, email: "Mock User", firstName: "Mock User", lastName: "Mock User", avatar: "Mock User"))
                self.users.append(contentsOf: users)
            case .failure: self.users.append(UserModel(id: 0, email: "No data found", firstName: "No data Found", lastName: "No data Found", avatar: "No data Found"))
            }
        }
    }
    
    func getUser(at index: Int) -> UserModel {
        let item = users[index]
        return item
    }
}

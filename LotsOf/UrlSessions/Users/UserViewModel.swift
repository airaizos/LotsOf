//
//  UserViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/9/22.
//

import Foundation
import UIKit

final class UserViewModel {
    
    private var userProvider = UserProvider()
    var refreshData = { () -> () in }
    
    var users = [UserModel]() {
        didSet {
           refreshData()
        }
    }
    
    func fetchUsers() {
        userProvider.fetchUsers { result in
            switch result {
            case .success(let users):
                self.users.append(contentsOf: users)
            case .failure: self.users.append(UserModel(id: 0, email: "No data found", firstName: "No data Found", lastName: "No data Found", avatar: "No data Found"))
            }
        }
    }
    
    func getUser(at index: Int) -> UserModel {
        let item = users[index]
        return item
    }
    
    func didSelectItem(at indexPath: IndexPath) -> UserModel {
        let item = users[indexPath.row]
        return item
    }
}

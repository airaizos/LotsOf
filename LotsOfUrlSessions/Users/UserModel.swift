//
//  UserModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/9/22.
//

import Foundation
//TODO: ¿Cómo creo un modulo con el viewModel, viewController?

struct UserResult: Decodable {
    let page: Int
    let per_page: Int
    let data: [UserModel]
}

struct UserModel: Decodable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String,CodingKey {
        case id,email,avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
}


struct UserDetailViewModel: Decodable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}

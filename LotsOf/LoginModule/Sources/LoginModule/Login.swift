//
//  Login.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/9/22.
// https://reqres.in/api/users/id
//https://reqres.in/api/users/1
//https://reqres.in/api/login

import Foundation


public struct LoginModel: Decodable {
  //  let email: String
  // let password: String
    let token: String?
    let error: String?
}

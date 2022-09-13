//
//  Dog.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 12/9/22.
//

import Foundation

struct Dog: Codable {
   // static var empty = Self {
    
    let id: String
    let url: String
    let width: Int?
    let height: Int?
}

//
//  EmmanuelModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/9/22.
//

import Foundation
 
struct EmmanuelModel: Codable {
    let userID: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

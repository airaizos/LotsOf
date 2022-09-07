//
//  OdenzaModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//

import Foundation

struct OdenzaDataModel: Decodable {
    let error: String
    let message: String
    let data: [PostModel]
    
}

struct PostModel: Decodable {
    let id: Int
    let title: String
    let post: String
}

//
//  ColorModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/9/22.
//

import Foundation


struct ColorsResult: Decodable{
 //   static var  empty: Self = .init(colors: [ColorModel(id: 0, name: "name", year: 0, color: "color", pantoneValue: "pantone")])

    var data : [ColorModel]
    
}

struct ColorModel: Decodable {
    let id: Int
    let name: String
    let year: Int
    let color: String
    let pantoneValue: String?
    
    enum CondingKeys: String, CodingKey {
   
        case id, name, year, color
        case pantoneValue =  "pantone_value"
    }
    
    static var empty: Self = .init(id: 0, name: "name", year: 0, color: "color", pantoneValue: "pantone")
}

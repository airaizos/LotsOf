//
//  ExclusivesPromosModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/11/22.
//

import Foundation

struct AntojitosPromos: Decodable {
    let promos: [ExclusivePromo]
}

struct ExclusivePromoCellModel {
    var image: String
    var firstLabel: String
    var secondLabel: String
}


struct ExclusivePromo: Decodable {
    let image: String
    let title: String
    let subtitle: String
}

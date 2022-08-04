//
//  Lineas.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import Foundation

struct Lines: Codable {
    let totalCount, start, rows: Int
    let result: [BusLine]
}

struct BusLine: Codable, Equatable {
    let name: String
}

struct BusLineCellViewModel {
    let lineLink: String
    var lineName: String  {
        guard let separator = lineLink.lastIndex(of: "/") else { return "/"}
        let short = String(lineLink[separator...])
        return short
    }
}

extension BusLine {
    var toCellViewModel: BusLineCellViewModel {
        BusLineCellViewModel(lineLink: name)
    }
}

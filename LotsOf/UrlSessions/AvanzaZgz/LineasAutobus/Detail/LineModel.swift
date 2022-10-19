//
//  LineModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 19/9/22.
//

import Foundation

struct LineModel: Decodable {
    let title: String
  //  let result: [GeometryModel]
    var customTitle: String?
    var isFavorite: Bool? = false
}

struct GeometryModel: Decodable {
    let geometry: Geometry
}

struct Geometry: Decodable {
    let type: String
    let coordinates: [[[Double]]]
    
}
/*
 {
 "totalCount":2,
 "start":0,
 "rows":2,
 "lastUpdated":"2013-10-14T08:40:00",
 "link":"/ciudad/viapublica/movilidad/movi/bus.htm",
 "icon":"bus",
 "description":"Transporte urbano",
 "title":"Transporte Urbano. Línea 33",
 "result":[{"geometry":
     {"type":"MultiLineString",
     "coordinates":[[[-0.9111278624152436,41.64434194162709],[-0.9110098452179104,41.644382029054896]]]}}]}
 */

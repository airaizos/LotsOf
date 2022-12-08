//
//  WorldCupMatchModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/11/22.
//

import Foundation

struct WorldCupMatch: Decodable {
    
    enum Group: String, Decodable {
        case groupA, groupB, groupC, groupD, groupE, groupF, groupG, groupH
        
        enum CodingKeys: String, CodingKey {
            case groupA = "Group A"
            case groupB = "Group B"
            case groupC = "Group C"
            case groupD = "Group D"
            case groupE = "Group E"
            case groupF = "Group F"
            case groupG = "Group G"
            case groupH = "Group H"
        }
    }
    
    enum Nation: String, Decodable {
        case Qatar, Ecuador, England, Iran
        case Senegal, Netherlands, USA, Wales
        case Argentina, SaudiArabia, Poland, Mexico
        case Tunisia, France, Australia, Denmark
        case Morocco, Croatia, Germany, Japan
        case Spain, CostaRica, Belgium, Canada
        case Switzerland, Cameron, Uruguay, KoreaRepublic
        case Portugal, Ghana, Brazil, Serbia
        
        enum CodingKeys: String, CodingKey {
            case Qatar, Ecuador, England, Iran,
                 Senegal, Netherlands, USA, Wales,
                 Argentina, Poland, Mexico, Denmark, Tunisia, France, Australia, Morocco, Croatia, Germany, Japan, Spain, Belgium, Canada, Switzerland, Cameron, Uruguay, Portugal, Ghana, Brazil, Serbia
            case SaudiArabia = "Saudi Arabia"
            case CostaRica = "Cosa Rica"
            case KoreaRepulic = "Korea Republic"
        }
    }
    
    let matchNumber: Int
    let roundNumber: Int
  //  let dateUtc: String
    let location: String
    let homeTeam: Nation
    let awayTeam: Nation
  //  let group: Group
    let homeTeamScore: Int?
    let awayTeamScore: Int?
    
    
    enum CodingKeys: String,CodingKey {
        case matchNumber = "MatchNumber"
        case roundNumber = "RoundNumber"
        case location = "Location"
        case homeTeam = "HomeTeam"
        case awayTeam = "AwayTeam"
   //     case group = "Group"
        case homeTeamScore = "HomeTeamScore"
        case awayTeamScore = "AwayTeamScore"
   //   case dateUtc
    }
    /*
    var matchDate: Date  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "es_ES")
        //UTC+1
        
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let dateD = dateFormatter.date(from: dateUtc) else { return Date() }
        
        return dateD.addingTimeInterval(3600)
    }
     */
}

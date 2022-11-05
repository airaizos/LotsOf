//
//  ChampionsLeagueViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 4/11/22.
//

import Foundation


final class ChampionsLeagueViewModel {
    
    //MARK: - Variables
    var teams: [Team] = [     Team(name: "Napoli", group: nil),
                              Team(name: "Liverpool", group: nil),
                              Team(name: "Ajax", group: nil),
                              Team(name: "Ranges", group: nil),
                              Team(name: "Porto", group: nil),
                              Team(name: "Club Brugge", group: nil),
                              Team(name: "Leverkusen", group: nil),
                              Team(name: "Atlético", group: nil),
                              Team(name: "Bayern", group: nil),
                              Team(name: "Inter", group: nil),
                              Team(name: "Barcelona", group: nil),
                              Team(name: "Plzen", group: nil),
                              Team(name: "Tottenham", group: nil),
                              Team(name: "Frankfurt", group: nil),
                              Team(name: "Sporting CP", group: nil),
                              Team(name: "Marseille", group: nil),
                              Team(name: "Chelsea", group: nil),
                              Team(name: "Milan", group: nil),
                              Team(name: "Salzburg", group: nil),
                              Team(name: "Dinamo Zagrab", group: nil),
                              Team(name: "Real Madrid", group: nil),
                              Team(name: "Leipzig", group: nil),
                              Team(name: "Shakhtar Donetsk", group: nil),
                              Team(name: "Celtic", group: nil),
                              Team(name: "Man City", group: nil),
                              Team(name: "Dortmund", group: nil),
                              Team(name: "Sevilla", group: nil),
                              Team(name: "Copenhagen", group: nil),
                              Team(name: "Benfica", group: nil),
                              Team(name: "Paris", group: nil),
                              Team(name: "Juventus", group: nil),
                              Team(name: "M. Haifa", group: nil),
                        ]
    var groupA: [Team] = [Team]()
    var groupB: [Team] = [Team]()
    var groupC: [Team] = [Team]()
    var groupD: [Team] = [Team]()
    var groupE: [Team] = [Team]()
    var groupF: [Team] = [Team]()
    var groupG: [Team] = [Team]()
    var groupH: [Team] = [Team]()
    
    
    //MARK: - Methods
    func teamsGroupsRaffle() {
        teams.shuffle()
        groupA.append(contentsOf: teams[0..<4])
        groupB.append(contentsOf: teams[4..<8])
        groupC.append(contentsOf: teams[8..<12])
        groupD.append(contentsOf: teams[12..<16])
        groupE.append(contentsOf: teams[16..<20])
        groupF.append(contentsOf: teams[20..<24])
        groupG.append(contentsOf: teams[24..<28])
        groupH.append(contentsOf: teams[28..<32])
       
    }
    //TODO: Hay que hacer tambien un array con los partidos que hay que jugar? 12 partidos ida y vuelta 3 por equipo
    
    /* indices
     0 - 1
     0 - 2
     0 - 3
     1 - 0
     1 - 2
     1 - 3
     2 - 0
     2 - 1
     2 - 3
     3 - 0
     3 - 1
     3 - 2
     */
    
}

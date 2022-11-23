//
//  GroupCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 21/11/22.
//

import UIKit

final class GroupCell: UICollectionViewCell {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    @IBOutlet weak var drawsLabel: UILabel!
    @IBOutlet weak var goalsForLabel: UILabel!
    @IBOutlet weak var goalsAgainst: UILabel!
    @IBOutlet weak var goalsDifference: UILabel!
    
    func configure(with model: GroupCellModel) {
        flagImage.loadImageUsingCache(withUrl: model.flag)
        nameLabel.text = model.name
        pointsLabel.text = "\(model.points)"
        winsLabel.text = "\(model.wins)"
        lossesLabel.text = "\(model.losses)"
        drawsLabel.text = "\(model.draws)"
        goalsForLabel.text = "\(model.goalsFor)"
        goalsAgainst.text = "\(model.goalsAgainst)"
        goalsDifference.text = "\(model.goalsDifference)"
    }
    
}

struct GroupCellModel {
    let flag: String
    let name: String
    var points: Int {
        return (wins * 3) + draws
    }
    let wins: Int
    let losses: Int
    let draws: Int
    let goalsFor: Int
    let goalsAgainst: Int
    var goalsDifference: Int {
        return goalsFor - goalsAgainst
    }
    
    
    
    
}

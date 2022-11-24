//
//  GroupCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 21/11/22.
//

import UIKit

final class GroupCell: UICollectionViewCell {
    //MARK: Outlets
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    @IBOutlet weak var drawsLabel: UILabel!
    @IBOutlet weak var goalsForLabel: UILabel!
    @IBOutlet weak var goalsAgainst: UILabel!
    @IBOutlet weak var goalsDifference: UILabel!
    
    
    //MARK: Functions
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
    
    func configure(with item: WorldCupTeam) {
        flagImage.loadImageUsingCache(withUrl: item.link)
        nameLabel.text = item.name
        pointsLabel.text = "\(0)"
        winsLabel.text = "\(0)"
        lossesLabel.text = "\(0)"
        drawsLabel.text = "\(0)"
        goalsForLabel.text = "\(0)"
        goalsAgainst.text = "\(0)"
        goalsDifference.text = "\(0)"
    }
    
    func setupLayer() {
        layer.backgroundColor = UIColor.black.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.cornerRadius = 1.0
        layer.shadowRadius = 2.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        layer.shadowRadius = 2.0
        
    }
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
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

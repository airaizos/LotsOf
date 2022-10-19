//
//  EmmanuelViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/9/22.
//

import UIKit

final class EmmanuelViewCell: UICollectionViewCell {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func configure(with item: EmmanuelModel) {
        userIdLabel.text = "\(item.userID)"
        titleLabel.text = item.title
        bodyLabel.text = item.body
        idLabel.text = "\(item.id)"
    }
}

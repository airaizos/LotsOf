//
//  PokemonTableViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
//

import UIKit

final class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

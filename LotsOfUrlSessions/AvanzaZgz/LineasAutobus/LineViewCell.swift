//
//  LineViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 4/8/22.
//

import UIKit

final class LineViewCell: UITableViewCell {

    @IBOutlet weak var lineBusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with line: String) {
        lineBusLabel.text = line
    }
}

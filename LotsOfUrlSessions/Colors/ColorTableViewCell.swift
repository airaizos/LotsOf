//
//  ColorTableViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/9/22.
//

import UIKit

final class ColorTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var colorView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pantoneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func configureCellWith() {
        
    }
    

}


struct ColorViewCell {
    
}

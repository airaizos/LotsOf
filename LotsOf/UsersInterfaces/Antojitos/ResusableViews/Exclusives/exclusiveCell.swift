//
//  ExclusiveCollectionViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/11/22.
//

import UIKit

final class ExclusiveCollectionViewCell: UICollectionViewCell {
    //MARK: Outlets
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    //MARK: Variables
    
    override var bounds: CGRect {
        didSet{
            self.layoutIfNeeded()
        }
    }
    //MARK: Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: Functions
    
    func configure(with model: ExclusivePromo) {
        
        image.loadImageUsingCache(withUrl: model.image)
        firstLabel.text = model.title
        secondLabel.text = model.subtitle
    }
}

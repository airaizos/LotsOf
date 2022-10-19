//
//  RickAndMortyCollectionViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
//

import UIKit

final class RickAndMortyCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var characterDimensionLabel: UILabel!
    @IBOutlet weak var chracterFirstEpisodeLabel: UILabel!
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    
    func configure(model: CharacterBasicInfo) {
        characterDimensionLabel.text = model.dimension
        chracterFirstEpisodeLabel.text = model.firstEpisodeTitle
        characterNameLabel.text = model.name
        characterImage.loadImageUsingCache(withUrl: model.image)
    }
}

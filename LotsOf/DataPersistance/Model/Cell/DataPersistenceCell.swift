//
//  DataPersistenceCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 24/11/22.
//

import UIKit

final class DataPersistenceCell: UICollectionViewCell {
    //MARK: Variables
    var item: appInfo! {
        didSet {
            self.updateUI()
        }
    }
    
    
    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var backgroundCell: UIView!
    
    //MARK: Functions
        func configure(with model: appInfo) {
            
            let appImage = model.image ??  "AppIcon"
            
            //TODO: Se puede hacer mejor, seguro
            if appImage.hasPrefix("http") {
                image.loadImageUsingCache(withUrl: appImage)
            } else if UIImage(systemName: appImage) == nil {
                image.image = UIImage(named: appImage)
                image.tintColor = .white
            } else {
                image.image = UIImage(systemName: appImage)
            }

            let color = model.backgroundColor ?? "#44d1df"
           
            
            
            titleLabel.text = model.name
            descriptionLabel.text = model.detail
           
            backgroundCell.backgroundColor = UIColor(hex: color)
         
            image.layer.cornerRadius = 10.0
            image.layer.masksToBounds = true
            
        }
        
        func description() -> String {
            "DataPersistenceCell"
        }
        
    func updateUI() {
       
        
    }
    
    
        //MARK: LifeCycle
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
        }
        
}

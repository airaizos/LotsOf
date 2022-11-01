//
//  TaskTypeCollectionViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 31/10/22.
//

import UIKit

final class TaskTypeCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets
    @IBOutlet weak var imageContainerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var typeName: UILabel!
    // MARK: Variables
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.imageContainerView.layer.cornerRadius = self.imageContainerView.bounds.width / 2
        }
    }

    // MARK: - Functions
    override class func description() -> String {
        return "TaskTypeCollectionViewCell"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
        self.imageView.image = nil
    }
    
    func setupCell(taskType: TaskType, isSelected: Bool) {
        self.typeName.text = taskType.typeName
        
        if isSelected {
            self.imageContainerView.backgroundColor = UIColor(hex: "ff5349").withAlphaComponent(0.5)
            self.typeName.textColor = UIColor(hex: "ff5349")
            self.imageView.tintColor = UIColor.white
            self.imageView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))
        } else {
            self.imageView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .regular))
            reset()
        }
    }
    
    func reset() {
        self.imageContainerView.backgroundColor = UIColor.clear
        self.typeName.textColor = UIColor(hex: "b13254")
        self.imageView.tintColor = UIColor(hex: "b13254")
    }
    
}

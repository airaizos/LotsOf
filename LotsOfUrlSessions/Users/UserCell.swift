//
//  UserCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 16/9/22.
//

import UIKit

final class UserCell: UICollectionViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configure(with model: UserModel) {
        
        avatarImageView.loadImageUsingCache(withUrl: model.avatar)
        firstNameLabel.text = model.firstName
        lastNameLabel.text = model.lastName
        emailLabel.text = model.email
        idLabel.text = ("\(model.id)")
    }
}

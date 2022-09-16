//
//  UserCollectionViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 16/9/22.
//

import UIKit

final class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    func configure(with model: UserModel) {
        print(model.firstName)
        firstNameLabel.text = "AQUI"
        firstNameLabel.text = model.firstName
        lastNameLabel.text = model.lastName
        emailLabel.text = model.email
        idLabel.text = model.email
        userImageView.loadImageUsingCache(withUrl: model.avatar)
    }
}

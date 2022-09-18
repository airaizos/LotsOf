//
//  UsersDetailViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/9/22.
// https://reqres.in/api/users/2  1-12

import UIKit

final class UsersDetailViewController: UIViewController {
    var userDetailViewModel: UserDetailViewModel?
    var padding: CGFloat = 20
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var firstNameLabel = UILabel.generateWith(font: .title2, textColor: .white)
    private lazy var lastNameLabel = UILabel.generateWith(font: .title1, textColor: .white)
    private lazy var emailLabel = UILabel.generateWith(font: .body, textColor: .systemBlue)
    
    private lazy var idLabel = UILabel.generateWith(font: .headline, textColor: .systemRed)
    
    
    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel, emailLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupUser()
    }
    
    private func setupView() {
        view.backgroundColor = .systemOrange
        view.addSubview(avatarImage)
        view.addSubview(userInfoStackView)
        view.addSubview(idLabel)
        
        NSLayoutConstraint.activate([
            idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            view.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: padding),
            
            avatarImage.topAnchor.constraint(greaterThanOrEqualTo: idLabel.bottomAnchor, constant: padding),
            avatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            avatarImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            userInfoStackView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: padding),
            userInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            view.trailingAnchor.constraint(equalTo: userInfoStackView.trailingAnchor, constant: padding)
        ])
    }
    
    static func create() -> UsersDetailViewController {
        return UIStoryboard(name: "UsersDetailViewController", bundle: .main).instantiateViewController(withIdentifier: "UsersDetailViewController") as! UsersDetailViewController
    }
}

extension UsersDetailViewController {
    func setupUser() {
        avatarImage.loadImageUsingCache(withUrl: userDetailViewModel?.avatar ?? "https://reqres.in/img/faces/12-image.jpg")
        firstNameLabel.text = userDetailViewModel?.firstName
        lastNameLabel.text = userDetailViewModel?.lastName
        emailLabel.text = userDetailViewModel?.email
        idLabel.text = String(describing:userDetailViewModel?.id)
    }
}

extension UILabel {
    static func generateWith(font: UIFont.TextStyle, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: font)
        label.textColor = textColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        
        //Shadow
        label.layer.cornerRadius = 12
        label.layer.shadowOpacity = 1
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 4
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return label
    }
}

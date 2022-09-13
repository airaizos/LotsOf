//
//  DogViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 12/9/22.
//

import UIKit

final class DogViewController: UIViewController {
    
    let viewModel = DogViewModel()
    var height:CGFloat = 200
    var width: CGFloat = 300
    
    let idLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.text = "ID"
        label.textAlignment = .center
        label.textColor = .systemPink
        label.backgroundColor = .systemGray
        return label
    }()
    
    
    let dogImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "patxi"))
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
     
        return view
    }()
    
    private lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 14.0, *) {
            let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] _ in
                self?.viewModel.networking.executeRequestedDog()
                
                DispatchQueue.main.async {
                    self?.idLabel.text = self?.viewModel.networking.dogs[0].id
                    self?.height = CGFloat(self?.viewModel.networking.dogs[0].height ?? 50)
                    
                    self?.width = CGFloat(self?.viewModel.networking.dogs[0].width ?? 50)
                    self?.dogImage.loadImageUsingCache(withUrl: self?.viewModel.networking.dogs[0].url ?? "patxi")
                    print(self?.viewModel.networking.dogs[0].url ?? "No data")
                    self?.view.updateConstraintsIfNeeded()
                }
                
            }))
            
            button.translatesAutoresizingMaskIntoConstraints = false
            if #available(iOS 15.0, *) {
                var configuration = UIButton.Configuration.bordered()
                configuration.title = "Refresh"
                button.configuration = configuration
            } else {
               let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
            }
            
            return button
        }
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .systemGreen
        view.addSubview(idLabel)
        view.addSubview(dogImage)
        view.addSubview(refreshButton)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor,constant: 20),
            
            dogImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dogImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dogImage.heightAnchor.constraint(equalToConstant: height),
            dogImage.widthAnchor.constraint(equalToConstant: width),
       
            
            refreshButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: refreshButton.bottomAnchor, constant: 40)
        ])
    }
}

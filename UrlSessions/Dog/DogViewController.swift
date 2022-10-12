//
//  DogViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 12/9/22.
//

import UIKit

final class DogViewController: UIViewController {
    
    private let viewModel = DogViewModel()
    
    private var height:CGFloat = 200
    private var width: CGFloat = 300
    
    private let idLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.text = "ID"
        label.textAlignment = .center
        label.textColor = .systemPink
        label.backgroundColor = .systemGray
        return label
    }()
    
    private let dogImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "patxi"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        viewModel.networking.executeRequestedDog()
        view.backgroundColor = .systemGreen
        view.addSubview(idLabel)
        view.addSubview(dogImage)
        bind()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            idLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            idLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor,constant: 20),
            
            dogImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dogImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dogImage.heightAnchor.constraint(equalToConstant: height),
            dogImage.widthAnchor.constraint(equalToConstant: width),

        ])
    }
    
    private func setupDogView() {
        idLabel.text = viewModel.dog.id
        height = CGFloat(viewModel.dog.height ?? 50)
        width = CGFloat(viewModel.dog.width ?? 50)
        dogImage.loadImageUsingCache(withUrl: viewModel.dog.url)
        view.updateConstraintsIfNeeded()
    }
    
    private func bind() {
        viewModel.networking.refreshData = {
            [weak self] in
            DispatchQueue.main.async {
                self?.setupDogView()
            }
        }
    }
}

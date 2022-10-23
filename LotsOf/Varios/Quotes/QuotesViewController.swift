//
//  QuotesViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 23/10/22.
//

import UIKit

final class QuotesViewController: UIViewController {
    var modelController: ModelController!
    
    
    var quoteTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var quoteStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [quoteTextLabel, authorLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton.customButton(title: "Edit", titleColor: .green, tintColor: .white)
        button.addTarget(self, action: #selector(editButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let quote = modelController.quote
        quoteTextLabel.text = quote.text
        authorLabel.text = quote.author
        
            
    }
    
    func setupView() {
        view.addSubview(quoteStackView)
        view.addSubview(editButton)
        
        NSLayoutConstraint.activate([
            quoteStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            quoteStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            quoteStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            editButton.topAnchor.constraint(equalTo: quoteStackView.bottomAnchor, constant: 20),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
    }
    
    
    //MARK: Actions
    
    @objc private func editButtonAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            let viewController = EditeQuotesViewController()
            viewController.modelController = self.modelController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    deinit {
        print("    [DEINIT] ->      QUOTES ViewController")
    }
}

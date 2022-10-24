//
//  QuotesViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 23/10/22.
//

import UIKit

final class QuotesViewController: UIViewController {
    var modelController: ModelController!
    var provider = QuotesProvider()

    private var quoteTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.makeShadow()
        return label
    }()
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.makeShadow()
        return label
    }()
   
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.makeShadow()
        button.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        return button
    }()
                     
    private lazy var quoteStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quoteTextLabel, authorLabel, editButton])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupQuote()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupQuote()
        provider.getQuotes()
    }
    
    
    func setupQuote() {
        let quote = modelController.quote
        quoteTextLabel.text = quote.text
        authorLabel.text = quote.author
    }
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(quoteStackView)
    
        NSLayoutConstraint.activate([
            quoteStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            quoteStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            quoteStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    //MARK: Actions
    
    @objc private func editButtonAction(sender: UIButton) {
        DispatchQueue.main.async {
            let viewController = EditeQuotesViewController()
            viewController.modelController = self.modelController
       //     self.present(viewController, animated: true)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    deinit {
        print("    [DEINIT] ->      QUOTES ViewController")
    }
}

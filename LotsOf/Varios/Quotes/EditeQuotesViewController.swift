//
//  EditeQuotesViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 23/10/22.
//

import Foundation
import UIKit

final class EditeQuotesViewController: UIViewController {
    var modelController: ModelController!
    
    
    let editQuoteTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let editAuthorTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    lazy var editStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [editQuoteTextView, editAuthorTextView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton.customButton(title: "save", titleColor: .systemPink, tintColor: .white)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupQuote()
        
    }
    
    
    func setupView() {
        view.addSubview(editStackView)
        view.addSubview(saveButton)
        
        
        NSLayoutConstraint.activate([
            editStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            editStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            editStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            saveButton.topAnchor.constraint(equalTo: editStackView.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupQuote() {
        let quote = modelController.quote
        editQuoteTextView.text = quote.text
        editAuthorTextView.text = quote.author
        
    }
}


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
    
    private let editQuoteTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.makeShadow()
        return textView
    }()
    
    private let editAuthorTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.makeShadow()
        return textView
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton.customButton(title: "Save".localized(), titleColor: .systemPink, tintColor: .white)
 //       button.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        button.addTarget(self, action: #selector(saveButtonActionNC), for: .touchUpInside)
        return button
    }()
    
    lazy var editStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [editQuoteTextView, editAuthorTextView,saveButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupQuote()
        
    }
    
    
    func setupView() {
        view.backgroundColor = .systemGray2
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
    
    private func setupQuote() {
        let quote = modelController.quote
        editQuoteTextView.text = quote.text
        editAuthorTextView.text = quote.author
    }
    
    private func saveQuote() {
        let newQuote = Quote(text: editQuoteTextView.text, author: editAuthorTextView.text)
        modelController.quote = newQuote
    }
    
    //TODO: Con el dismiss no guarda los cambios y con el navigationguarda ,pero  no va hacia atrás. algon con el viewWillAppear ¿Enviar un refreshdata desde el init?
    @objc private func saveButtonAction(sender: UIButton) {
        DispatchQueue.main.async {
            self.saveQuote()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func saveButtonActionNC(sender: UIButton) {
        
        DispatchQueue.main.async {
            self.saveQuote()
            let viewController = QuotesViewController()
            viewController.modelController = self.modelController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    
    deinit {
        
        print("    [DEINIT] ->      EDITQUOTES ViewController")
    }
}


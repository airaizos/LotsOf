//
//  MourdevUserDefaultsViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
//

import UIKit

final class MourdevUserDefaultsViewController: UIViewController {
    
    var textField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Escribe aquí"
        textField.font = .systemFont(ofSize: 30)
        return textField
    }()
    
    private lazy var getData: UIButton = {
        let button = UIButton.customButton(title: "GET", titleColor: .systemRed, tintColor: .white)
        button.addTarget(self, action: #selector(getButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var putData: UIButton = {
        let button = UIButton.customButton(title: "PUT", titleColor: .systemGreen, tintColor: .white)
        button.addTarget(self, action: #selector(putButtonAction(_ :)), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteData: UIButton = {
        let button = UIButton.customButton(title: "DELETE", titleColor: .systemBlue, tintColor: .white)
        button.addTarget(self, action: #selector(deleteButtonAction(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var buttonsStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [getData,putData,deleteData])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
    }()
    
    
    //ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(buttonsStackView)
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
    
    //Actions
    @objc private func getButtonAction(_ sender: UIButton) {
    }
    
    @objc private func putButtonAction(_ sender: UIButton) {
    }
    
    @objc private func deleteButtonAction(_ sender: UIButton) {
    }
    
}

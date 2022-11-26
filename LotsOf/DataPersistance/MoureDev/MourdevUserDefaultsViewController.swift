//
//  MourdevUserDefaultsViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
//

import UIKit

final class MourdevUserDefaultsViewController: UIViewController {
    
    let viewModel = MourdevUserDefaultsViewModel()
    
    var PersistenceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .magenta
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
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
        view.backgroundColor = .systemGray2
        view.addSubview(buttonsStackView)
        view.addSubview(textField)
        view.addSubview(PersistenceLabel)
        
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            view.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 20),
            
            PersistenceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: PersistenceLabel.trailingAnchor, constant: 20),
            PersistenceLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20)
            
        ])
    }
    
    //Actions
    @objc private func getButtonAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.PersistenceLabel.text = self.viewModel.getText()
        }
        showAlert(message: viewModel.message)
        LogManager.shared.log(viewModel.message)
    }
    
    @objc private func putButtonAction(_ sender: UIButton) {
        guard let text = textField.text else { return }
        viewModel.save(text: text)
        showAlert(message: viewModel.message)
        LogManager.shared.log(viewModel.message)
    }
    
    @objc private func deleteButtonAction(_ sender: UIButton) {
        viewModel.deleteText()
        showAlert(message: viewModel.message)
        LogManager.shared.log(viewModel.message)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    deinit {
        print("    [DEINIT] ->      MOUREDEV ViewController")
    }
}

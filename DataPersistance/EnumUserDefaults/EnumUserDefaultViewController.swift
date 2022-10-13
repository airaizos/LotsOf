//
//  EnumUserDefaultViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
//

import UIKit

final class EnumUserDefaultViewController: UIViewController {
    let viewModel = EnumUserDefaultsModel()
    
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textColor = .white
        
        return label
    }()
    lazy var saveDataButton: UIButton = {
        let button = UIButton.customButton(title: "Save Data", titleColor: .cyan, tintColor: .darkGray)
        button.addTarget(self, action: #selector(saveData(_:)), for: .touchUpInside)
        return button
    }()
    
    
    lazy var readDataButton:  UIButton = {
        let button = UIButton.customButton(title: "Read Data", titleColor: .red, tintColor: .systemPink)
        button.addTarget(self, action: #selector(readData(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .systemGray2
        saveDataButton.makeShadow()
        readDataButton.makeShadow()
        
        view.addSubview(saveDataButton)
        view.addSubview(readDataButton)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            saveDataButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            saveDataButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 15),
            readDataButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 75),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
             
        ])
    }
    
   @objc private func saveData(_ sender: UIButton) {
       nameLabel.text = viewModel.writeRoleMember()
       print("pressed")
    }
    
    @objc private func readData(_ sender: UIButton) {
        nameLabel.text = viewModel.readRoleMember()
        print("pressed")
    }
    
    deinit {
        print("    [DEINIT] ->      ENUMS ViewController")
    }
}

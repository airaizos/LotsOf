//
//  ExtensionButton.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/10/22.
//

import UIKit

extension UIButton {
    static func customButton(title: String, titleColor: UIColor, tintColor: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tintColor = tintColor
        
      
        return button
    }
    
    func makeShadow() {
        layer.cornerRadius = 12
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

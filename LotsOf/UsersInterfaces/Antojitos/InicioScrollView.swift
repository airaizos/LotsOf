//
//  InicioScrollView.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 22/10/22.
//

import UIKit

class InicioScrollView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let nib = UINib(nibName: "InicioScrollView", bundle: nil)
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Erorr ")
        }
        print("customView")
        addSubview(customView)
        
    }
    
    
}

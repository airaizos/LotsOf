//
//  customView.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 25/10/22.
//

import UIKit

class CustomView: UIView {

  
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        let nib = UINib(nibName: "customView", bundle: nil)
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Erorr ")
        }
        print("customView")
        addSubview(customView)
        
    }
}

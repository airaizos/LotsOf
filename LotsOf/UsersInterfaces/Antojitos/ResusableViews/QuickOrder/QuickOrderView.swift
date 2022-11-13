//
//  QuickOrderView.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/11/22.
//

import UIKit

final class QuickOrderView: UIView {
    //MARK: Variables
    private weak var presentationController: UIViewController?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    //MARK: - Functions
    private func setupView() {
        let nib = UINib(nibName: "QuickOrderView", bundle: .main)
        guard let quickOrderView = nib.instantiate(withOwner: self, options: nil).first as? UIView else { LogManager.shared.log("Error QuickOrderView")
            
            fatalError("RV")}
        addSubview(quickOrderView)
    }
    
    func setup(presentationController: UIViewController) {
        self.presentationController = presentationController
    }
}

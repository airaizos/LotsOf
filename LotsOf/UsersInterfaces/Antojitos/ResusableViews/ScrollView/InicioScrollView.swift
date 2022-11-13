//
//  InicioScrollView.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 22/10/22.
//

import UIKit

final class InicioScrollView: UIView {
    //MARK: - Variables
    
    private weak var presentationController: UIViewController?
    
    
    //MARK: IBOulets
    @IBOutlet weak var pollosButton: UIButton!
    
    
    //MARK: LifeCycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    //MARK: Functions
   private func setupView() {
        let nib = UINib(nibName: "InicioScrollView", bundle: nil)
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Erorr ")
        }
        
        addSubview(customView)
        
    }
    
    func setup(presentationController: UIViewController) {
        self.presentationController = presentationController
      
    }
    
    //MARK: IBActions
    
    @IBAction func combinadosPressed(_ sender: UIButton) {
        print("buttonPressed")
        
    }
    
    
    
    
}

//
//  PromotionalCodeView.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 28/10/22.
//

import UIKit

final class PromotionalCodeView: UIView {
    
    

    let viewModel = PromotionalCodeViewModel()
    
    private weak var presentationController: UIViewController?
    
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var verifyCodebutton: UIButton!
    @IBOutlet weak var promotionalCodeTextField: UITextField!
    
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        setupView()
        
    }
    
    private func setupView() {
        let nib = UINib(nibName: "PromotionalCodeView", bundle: nil)
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
        fatalError("No se ha podido cargar PromotionalCode ")}
     
        addSubview(customView)
    }
    
    func setup(presentationController: UIViewController) {
        self.presentationController = presentationController
    }
    
    @IBAction func scanQrAction(_ sender: UIButton) {
    }
    
    @IBAction func verifyCodeAction(_ sender: UIButton) {
        guard let text = promotionalCodeTextField.text else { return }
        
        if viewModel.validateUserCode(from: text) {
            showAlert(message: "Código Válido")
            verifyCodebutton.backgroundColor = .systemGreen
            
            
        } else {
            showAlert(message: "Código No Válido")
            verifyCodebutton.backgroundColor = .systemRed
        }
        //cómo devuelvo un mensaje de Codigo no valido
        
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.presentationController?.present(alert, animated: true)
    }
    
}

extension PromotionalCodeView {
  
}

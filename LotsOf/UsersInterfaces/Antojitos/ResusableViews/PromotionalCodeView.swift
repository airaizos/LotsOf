//
//  PromotionalCodeView.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 28/10/22.
//

import UIKit

final class PromotionalCodeView: UIView {

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
    
    
    @IBAction func scanQrAction(_ sender: UIButton) {
    }
    
    @IBAction func verifyCodeAction(_ sender: UIButton) {
    }
    
}

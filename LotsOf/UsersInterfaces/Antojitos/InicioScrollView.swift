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
    
    
    //MARK: Labels
    
    //MARK: Actions
    
    @IBAction func sabesLoQueQuieres(_ sender: UIButton) {
    }
    
    @IBAction func repetirPedido(_ sender: UIButton) {
    }
    
    //MARK: Outlets
    @IBOutlet weak var bigPromoImage: UIImageView!
    
    //MARK: TerritorioStack
    
    @IBOutlet weak var territorioPromosLabel: UILabel!
    @IBAction func escanearQR(_ sender: UIButton) {
    }
    @IBOutlet weak var codigoPromocionalTextField: UITextField!
    @IBAction func validaCodigoPromo(_ sender: UIButton) {
    }
    
    //MARK: Exclusivas APP
    
    @IBOutlet weak var exclusivasLabel: UILabel!
    @IBAction func verPromociones(_ sender: UIButton) {
    }
    
    @IBOutlet weak var exclusivasAppCollectionView: UICollectionView!
    
    //MARK: Mejores Promos
    
    @IBOutlet weak var mejoresPromos: UILabel!
    
    
    @IBAction func mejoresPromosverTodasAction(_ sender: UIButton) {
    }
    
    //MARK: La Carta
    
    @IBAction func polloButtonAction(_ sender: UIButton) {
    }
    @IBAction func racionesButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func combinadosButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func arepasyMasButtonAction(_ sender: UIButton) {
    }
    //MARK: Nuestras Masas
    
    @IBOutlet weak var enrollateLabel: UILabel!
    
    @IBOutlet weak var pruebaNuestrasMasasLabel: UILabel!
    


    
}

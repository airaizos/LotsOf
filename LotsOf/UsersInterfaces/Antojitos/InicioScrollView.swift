//
//  InicioScrollView.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 22/10/22.
//

import UIKit

final class InicioScrollView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
   

    
    private func setupView() {
 
    }
    
    
    //MARK: Labels
    
    //MARK: Outlets
    @IBOutlet weak var bigPromoImage: UIImageView!
    
    //MARK: TerritorioStack
    
    @IBOutlet weak var territorioPromosLable: UILabel!
    @IBAction func escanearQR(_ sender: UIButton) {
    }
    @IBOutlet weak var codigoPromocionalTextField: UITextField!
    @IBAction func validaCodigoPromo(_ sender: UIButton) {
    }
    
    //MARK: Exclusivas APP
    
    @IBOutlet weak var exclusivasLabel: UILabel!
    @IBAction func verPromociones(_ sender: UIButton) {
    }
    
    //MARK: Mejores Promos
    
    @IBOutlet weak var mejoresPromos: UILabel!
    
    
    @IBAction func mejoresPromosverTodasAction(_ sender: UIButton) {
    }
    @IBOutlet weak var exclusivasAppCollectionView: UICollectionView!
    
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
    
    @IBOutlet weak var MasasCollectionView: UICollectionView!
    //MARK: Actions
    
    @IBAction func sabesLoQueQuieres(_ sender: UIButton) {
    }
    
    @IBAction func repetirPedido(_ sender: UIButton) {
    }
    
}

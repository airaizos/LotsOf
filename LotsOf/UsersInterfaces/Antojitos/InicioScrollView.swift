//
//  InicioScrollView.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 22/10/22.
//

import UIKit

final class InicioScrollView: UIView {
    
    //MARK: Labels
    
    //MARK: Outlets
    @IBOutlet weak var bigPromoImage: UIImageView!
    
    //TerritorioStack
    
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
    
    @IBOutlet weak var exclusivasAppCollectionView: UICollectionView!
    
    
    //MARK: Actions
    
    @IBAction func sabesLoQueQuieres(_ sender: UIButton) {
    }
    
    @IBAction func repetirPedido(_ sender: UIButton) {
    }
    
}

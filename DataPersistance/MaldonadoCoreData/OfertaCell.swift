//
//  MaldonadoNoteListCollectionViewCell.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/10/22.
//OfertaCell

import UIKit

final class OfertaCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var empresaLabel: UILabel!
    @IBOutlet weak var lugarLabel: UILabel!
    @IBOutlet weak var salarioLabel: UILabel!
    @IBOutlet weak var modalidadLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var favoritaImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with item: Oferta) {
        var fechaPublicacion: String {
            let dateFormater = DateFormatter()
            dateFormater.dateStyle = .medium
            dateFormater.locale = Locale.current
            return dateFormater.string(from: item.fecha ?? Date())
        }
        var favorite: UIImage {
            switch item.favorita {
            case true:
                return UIImage(systemName: "bookmark.fill")!
            case false:
                return UIImage(systemName: "bookmark")!
            }
        }
        
        image.image = UIImage(named: "oferta1")
        tituloLabel.text = item.titulo
        empresaLabel.text = item.empresa
        lugarLabel.text = item.lugar
        salarioLabel.text = "No disponible"
        modalidadLabel.text = "\(String(describing: item.modalidad))"
        fechaLabel.text = fechaPublicacion
        favoritaImage.image = favorite
    }
}

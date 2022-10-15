//
//  OfertaModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/10/22.
//

import UIKit

enum ModalidadTrabajo {
    case Presencial, Hibrido, Teletrabajo
}

struct OfertaModel {
    let image: UIImage
    let titulo: String
    let empresa: String
    let favorita: Bool
    let fechaPublicacion: Date
    let lugar: String
    let modalidad: ModalidadTrabajo
    
    
}

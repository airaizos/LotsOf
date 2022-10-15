//
//  OfertaModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/10/22.
//

import CoreData
import UIKit

final class Modelo {
    //Hace la conexión a la base de datos
    func contexto() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    //Guarda los datos que tenemos
    func saveData(titulo: String, empresa: String, lugar: String,fecha: Date, modalidad: ModalidadTrabajo, favorita: Bool, image: UIImage) {
        
        let context = contexto()
      //  let entityOferta = NSEntityDescription.insertNewObject(forEntityName: "Oferta", into: context as! OfertaModel)
    }
    
}

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

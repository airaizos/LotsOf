//
//  OfertaModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/10/22.
//

import Foundation
import CoreData
import UIKit

final class OfertaModelo {
    
    public static let shared = OfertaModelo()
    //Hace la conexión a la base de datos
    func contexto() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    //Guarda los datos que tenemos
    func saveData(oferta: OfertaModel) {
        
        let context = contexto()
        let entityOferta = NSEntityDescription.insertNewObject(forEntityName: "Oferta", into: context) as! Oferta
        
        entityOferta.titulo = oferta.titulo
        entityOferta.empresa = oferta.empresa
        entityOferta.lugar = oferta.lugar
        entityOferta.fecha = oferta.fecha
        entityOferta.modalidad = "\(oferta.modalidad)"
        entityOferta.favorita = oferta.favorita
        entityOferta.imagen = oferta.imagen.pngData()
        
        do {
            try context.save()
            print("Guardado!")
        } catch let error as NSError {
            print("no guardó \(error)")
        }
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
    let fecha: Date
    let lugar: String
    let modalidad: ModalidadTrabajo
    let imagen: UIImage = UIImage(named: "star")
    
    
}

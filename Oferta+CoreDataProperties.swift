//
//  Oferta+CoreDataProperties.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/10/22.
//
//

import Foundation
import CoreData


extension Oferta {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Oferta> {
        return NSFetchRequest<Oferta>(entityName: "Oferta")
    }

    @NSManaged public var modalidad: String?
    @NSManaged public var lugar: String?
    @NSManaged public var fecha: Date?
    @NSManaged public var favorita: Bool
    @NSManaged public var empresa: String?
    @NSManaged public var titulo: String?
    @NSManaged public var imagen: Data?

}

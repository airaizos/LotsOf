//
//  MaldonadoNoteListViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/10/22.
//

import UIKit
import CoreData

final class OfertaListViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    var ofertas = [Oferta]()
    var fetchResultController: NSFetchedResultsController<Oferta>!
    
    
    @IBOutlet weak var ofertasCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        
    }
    
    func mostrarOfertas() {
        let contexto = OfertaModelo.shared.contexto()
        let fetchRequest: NSFetchRequest<Oferta> = Oferta.fetchRequest()
        let firstOrder = NSSortDescriptor(key: "titulo", ascending: true)
        fetchRequest.sortDescriptors = [firstOrder]
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        
        do {
            try fetchResultController.performFetch()
            ofertas = fetchResultController.fetchedObjects!
        } catch let error as NSError {
            print("No se puede mostrar nada \(error.localizedDescription)")
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        ofertasCollectionView.reloadData()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        ofertasCollectionView.reloadData()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            self.ofertasCollectionView.insertItems(at: [newIndexPath!])
        case .delete:
            self.ofertasCollectionView.deleteItems(at: [indexPath!])
        case .move:
            self.ofertasCollectionView.moveItem(at: indexPath!, to: newIndexPath!)
        case .update:
            self.ofertasCollectionView.reloadData()
        @unknown default:
            self.ofertasCollectionView.reloadData()
        }
        self.ofertas = controller.fetchedObjects as! [Oferta]
    }
    
    
    @IBAction func addOferta(_ sender: UIBarButtonItem) {
        goTo(viewControllerName: "OfertaViewController")
    }
    
    deinit {
        print("    [DEINIT] ->      OFERTALIST ViewController")
    }
}

extension OfertaListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ofertas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = ofertasCollectionView.dequeueReusableCell(withReuseIdentifier: "OfertaCell", for: indexPath) as! OfertaCell
        let item = ofertas[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    
    
}

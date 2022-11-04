//
//  TaskListViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/11/22.
//

import UIKit
import CoreData

final class TaskListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var tasks = [TaskCD]()
    var fetchedResultController: NSFetchedResultsController<TaskCD>!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTable()
    }
    
    // MARK: - Outlets & objc functions
    
    // MARK: - Functions
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        fetchTaskList()
    }

    deinit {
        
        print("    [DEINIT] ->      TASKLIST ViewController")
    }
}

extension TaskListViewController: UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.taskDescription
        
        let bgColorView = UIView()
        bgColorView.layer.cornerRadius = 12
        bgColorView.backgroundColor = UIColor(hex: "ff5349")
        cell.selectedBackgroundView? = bgColorView
        
        return cell
        
    }
    
    //MARK:  - NSFetchedResults
    func fetchTaskList() {
        let context = TaskCDModel.shared.context()
        let fetchedRequest: NSFetchRequest<TaskCD> = TaskCD.fetchRequest()
        let firstOrder = NSSortDescriptor(key: "name", ascending: true)
        let secondOrder = NSSortDescriptor(key: "taskDescription", ascending: true)
        fetchedRequest.sortDescriptors = [firstOrder,secondOrder]
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchedRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
            tasks = fetchedResultController.fetchedObjects!
            print(" [ Tareas recopiladas ] -> Task")
            LogManager.shared.log("[ Tareas recopiladas ] -> Task")
            
        } catch let error {
            print("[ No recuperó datos ] X -> \(error)")
        }
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .insert:
            self.tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            self.tableView.deleteRows(at: [indexPath!], with: .fade)
        case .move:
            self.tableView.moveRow(at: [indexPath!.row], to: [newIndexPath!.row])
        case .update:
            self.tableView.reloadRows(at: [indexPath!], with: .fade)
        @unknown default:
            self.tableView.reloadData()
        }
        self.tasks = controller.fetchedObjects as! [TaskCD]
    }
    
   
}

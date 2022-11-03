//
//  TaskCDModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/11/22.
//

import UIKit
import CoreData


final class TaskCDModel {
    
    public static let shared = TaskCDModel()
    
    //MARK: - Functions
    func context() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func saveData(name: String, description: String, seconds: Int, timeStamp: Double) {
        let context = context()
        let entityTask = NSEntityDescription.insertNewObject(forEntityName: "TaskCD", into: context) as! TaskCD
        entityTask.name = name
        entityTask.taskDescription = description
        entityTask.seconds = Int16(seconds)
        entityTask.timeStamp = timeStamp
        
        do {
            try context.save()
            print("[ Guardo ] -> Task")
        } catch let error as  NSError {
            print("[ No guardó ]  X -> X Task: \(error)")
        }
    }
    
    
}

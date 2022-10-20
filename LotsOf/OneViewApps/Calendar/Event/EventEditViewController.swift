//
//  EventEditViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import UIKit

final class EventEditViewController: UIViewController {

    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventDatePicker.date = selectedDate
    }
    

    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = eventTextField.text
        newEvent.date = eventDatePicker.date
        
        eventsList.append(newEvent)
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("    [DEINIT] ->      EVENT ViewController")
    }
}

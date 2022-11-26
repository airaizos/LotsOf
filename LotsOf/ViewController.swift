//
//  ViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/9/22.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var lotsOfPracticeLabel: UILabel!
    
    @IBOutlet weak var urlSessionsButton: UIButton!
    
    @IBOutlet weak var uibutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = "Lots Of Practice"
    }
    
    @IBAction func goToURLSessions(_ sender: UIButton) {
        goTo(viewControllerName: "URLSessionsViewController")
    }
    
    @IBAction func goToUI(_ sender: UIButton) {
        goTo(viewControllerName: "UserInterfacesViewController")
    }
   
    
    @IBAction func goToDataPersistence(_ sender: UIButton) {
        goTo(viewControllerName: "DataPersistenceViewController")
    }
    
    @IBAction func goToOneViewApps(_ sender: UIButton) {
        goTo(viewControllerName: "OneViewAppsViewController")
    }
    
    @IBAction func button(_ sender: UIButton) {
        
      
    }
    
    @IBAction func goToAnimations(_ sender: UIButton) {
        goTo(viewControllerName: "LotsOfAnimationsViewController")
    }
    
    @IBAction func goToPermissions(_ sender: UIButton) {
        goTo(viewControllerName: "PermissionsViewController")
    }
    
}

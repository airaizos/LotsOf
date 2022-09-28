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
        urlSessionsButton.setTitle("🌐", for: .normal
        )
        uibutton.setTitle("📱", for: .normal)
        
    }
    
    @IBAction func goToURLSessions(_ sender: UIButton) {
        goTo(viewControllerName: "URLSessionsViewController")
    }
    
    @IBAction func goToUI(_ sender: UIButton) {
    }
   
    
    @IBAction func goToAnimations(_ sender: UIButton) {
        goTo(viewControllerName: "LotsOfAnimationsViewController")
    }
}

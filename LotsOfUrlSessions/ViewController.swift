//
//  ViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var busLines: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func goToLines(_ sender: UIButton) {
        busLines.addTarget(self, action: #selector(goToLinesViewController(_:)), for: .touchUpInside)
    }
    
    @objc private func goToLinesViewController(_ sender: UIButton) {
        self.present(LinesViewController(), animated: true)
        print("Pulsado Lines")
    }
}


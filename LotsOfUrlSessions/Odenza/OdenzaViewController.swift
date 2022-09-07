//
//  OdenzaViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 7/9/22.
//

import UIKit

final class OdenzaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 15.0, *) {
            view.backgroundColor = .systemMint
        } else {
            view.backgroundColor = .systemBlue
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

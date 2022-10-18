//
//  WeeklyCalendarViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/10/22.
//

import UIKit

final class WeeklyCalendarViewController: UIViewController {

    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func previousMonth(_ sender: Any) {
    }
    
    @IBAction func nextMonth(_ sender: UIButton) {
    }
    
    
    deinit {
        
        print("    [DEINIT] ->      WeeklyCalendarViewController ViewController")
    }

}

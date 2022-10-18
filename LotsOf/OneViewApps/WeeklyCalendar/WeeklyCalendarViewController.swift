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
    
    var selectedDate = Date()
    var totalSquares = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    //FUNC
    
    func setCellsView() {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
        
    }
    

    @IBAction func previousMonth(_ sender: Any) {
    }
    
    @IBAction func nextMonth(_ sender: UIButton) {
    }
    
    
    deinit {
        
        print("    [DEINIT] ->      WeeklyCalendarViewController ViewController")
    }

}


extension WeeklyCalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dayOfMonth.text = totalSquares[indexPath.row]
        return cell
        
    }
    

    
}

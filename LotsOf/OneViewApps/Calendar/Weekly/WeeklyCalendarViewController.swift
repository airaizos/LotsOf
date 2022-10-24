//
//  WeeklyCalendarViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/10/22.
//

import UIKit

var selectedDate = Date()

final class WeeklyCalendarViewController: UIViewController {
    
    var totalSquares = [Date]()
    
    @IBOutlet weak var monthlabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setWeekView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    //MARK: FUNC
    //No cambia el ancho
    func setCellsView() {
        let width = (collectionView.frame.size.width - 2 ) / 6
        let height = (collectionView.frame.size.height - 2 ) / 8
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setWeekView() {
        totalSquares.removeAll()
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday) {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
        monthlabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    
    //MARK: IBActions
    
    @IBAction func addEventAction(_ sender: UIBarButtonItem) {
        goTo(viewControllerName: "EventEditViewController")
    }
    
    @IBAction func previousWeek(_ sender: UIButton) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
    
    @IBAction func nextWeek(_ sender: UIButton) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    
    deinit {
        print("    [DEINIT] ->      WEEKLYCALENDAR ViewController")
    }
}


extension WeeklyCalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeekCell", for: indexPath) as! WeekCell
        
        let date = totalSquares[indexPath.item]
        cell.dayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))
        
        if (date == selectedDate) {
            cell.backgroundColor = UIColor.systemGreen
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.item]
        collectionView.reloadData()
        tableView.reloadData()
        
    }
    
}

extension WeeklyCalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event().eventsForDate(date: selectedDate).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell")!
        let events = Event().eventsForDate(date: selectedDate)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name + " " + CalendarHelper().timeString(date: event.date)
        return cell
    }

}

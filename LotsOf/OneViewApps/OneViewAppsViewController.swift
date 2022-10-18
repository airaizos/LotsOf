//
//  OneViewAppsViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/10/22.
//

import UIKit

final class OneViewAppsViewController: UIViewController {
    let viewModel = OneViewAppsViewModel()
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    deinit {
        print("    [DEINIT] ->      ONEVIEWAPP ViewController")
    }
}


extension OneViewAppsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appCell")!
        let item = viewModel.appList[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.appList[indexPath.row]
        
    }
    
    func navigate(to item: appInfo) {
        DispatchQueue.main.async {
            self.goTo(viewControllerName: item.viewController)
        }
    }
}

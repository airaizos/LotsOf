//
//  UserInterfacesViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import UIKit

final class UserInterfacesViewController: UIViewController {

    let viewModel = UserInterfacesViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func setupView() {
        
    }

}


extension UserInterfacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.appsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "uiCell")!
        
        let item = viewModel.appsList[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.detail
        
        let bgColorView = UIView()
        bgColorView.layer.cornerRadius = 12
        bgColorView.backgroundColor = UIColor(hex: "e40a92")
        cell.selectedBackgroundView? = bgColorView
        return cell
    }
    
    
    private func navigate(to viewController: String) {
        goTo(viewControllerName: viewController)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.appsList[indexPath.row]
        
        
        navigate(to: item.viewController)
        
    }
}

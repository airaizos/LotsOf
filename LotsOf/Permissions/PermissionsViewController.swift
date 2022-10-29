//
//  PermissionsViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 29/10/22.
// 863BFD

import UIKit

final class PermissionsViewController: UIViewController {
    
    let viewModel = PermissionsViewModel()
    let reusableCell = "permissionsCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    deinit {
        
        print("    [DEINIT] ->      PERMISSIONS ViewController")
    }
}

extension PermissionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell) else { fatalError("No se ha podido cargar  \(reusableCell)")}
        let item = viewModel.appList[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.detail
 
        cell.selectedBackgroundView? = UIView().makeBackgroundColor(hex: "6C3BFD")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.appList[indexPath.row]
        navigate(to: item.viewController)
    }
    
    func navigate(to item: String) {
        DispatchQueue.main.async {
            self.goTo(viewControllerName: item)
        }
    }
}

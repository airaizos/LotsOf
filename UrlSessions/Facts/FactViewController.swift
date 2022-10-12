//
//  FactViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 11/10/22.
//

import UIKit

final class FactViewController: UIViewController {
    
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = FactViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    private func configureView() {
        activityView.isHidden = false
        viewModel.fetchFact()
        activityView.startAnimating()
        bindViewModelWithView()
    }
    
    private func bindViewModelWithView() {
        // este es el enlace para cuando los datos llegan al array de Facts
        viewModel.refreshData = { [weak self]  in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityView.stopAnimating()
                self?.activityView.isHidden = true
            }
            
        }
    }
    
    @IBAction func addFactAction(_ sender: UIBarButtonItem) {
        viewModel.fetchFact()
    }
    
}


extension FactViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "factCell")!
        
        let item = viewModel.dataArray[indexPath.row]
        cell.textLabel?.text = item.text
        
        return cell
    }
}

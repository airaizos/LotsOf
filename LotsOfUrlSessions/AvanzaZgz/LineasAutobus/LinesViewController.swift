//
//  LinesViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import UIKit

final class LinesViewController: UIViewController {
    
    
    var viewModel = LinesViewModel()
    
    @IBOutlet weak var linesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
       setupTableView()
    }
    
    private func setupTableView() {
        linesTableView.dataSource = self
        linesTableView.delegate = self
    }
}

extension LinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getLines().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cellViewModel(at: indexPath)
        guard let cell = linesTableView.dequeueReusableCell(withIdentifier: "lineCell", for: indexPath) as? LineViewCell else { return LineViewCell()
        }
        cell.configure(with: cellViewModel)
        return cell
    }
}

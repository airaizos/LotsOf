//
//  LinesViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import UIKit

final class LinesViewController: UIViewController {
    deinit {
        print("Deinit LinesViewController")
    }
    
    var viewModel = LinesViewModel()
    
    @IBOutlet weak var linesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemRed
        viewModel.delegate = self
    }
    
    private func setupTableView() {
        
        linesTableView.dataSource = self
        linesTableView.delegate = self
        linesTableView.reloadData()
        viewModel.getLines()
    }
}

extension LinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.busLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cellViewModel(at: indexPath)
        
        guard let cell = linesTableView.dequeueReusableCell(withIdentifier: "lineCell", for: indexPath) as? LineViewCell else { return LineViewCell()
        }
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.didSelectItem(at: indexPath)
        navigate(to: item)
        
    }
    
    func navigate(to item: String) {
        let lineName = item.separateBusLineName
        
        DispatchQueue.main.async {
            let viewController = LineDetailViewModel().build(with: lineName)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
}



extension LinesViewController: APIClientDelegate {
    func getLines() {
        
    }
}

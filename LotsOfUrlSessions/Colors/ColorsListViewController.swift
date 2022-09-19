//
//  ColorsListViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/9/22.
//

import UIKit

final class ColorsListViewController: UIViewController {
    
    var viewModel = ColorsListViewModel()
    
    @IBOutlet weak var colorsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupColorsTableView()
       // viewModel.fetchColors()
        viewModel.getColorsList()
        reloadData()
    }
    
    func setupColorsTableView() {
        colorsTableView.delegate = self
        colorsTableView.dataSource = self
    }
}

extension ColorsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.colorsLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.getColor(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as? ColorTableViewCell else {
            fatalError("No se puede cargar colorCell")
        }
        
        cell.nameLabel.text = item.name
        cell.pantoneLabel.text = item.pantoneValue
        cell.colorView.backgroundColor = UIColor(hex: item.color)
        
        return cell
        }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.colorsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.colorsLists[indexPath.row]
        navigate(to: item)
        
    }
    
    func navigate(to item: ColorModel) {
        DispatchQueue.main.async {
            let viewController = ColorsViewModel().build(with: item)
            
            self.present(viewController, animated: true)
        }
    }
    
}

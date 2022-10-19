//
//  PokemonsViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
//

import UIKit

final class PokemonsViewController: UIViewController {
    
    var viewModel = PokemonsViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        setupTableView()
        setupView()
        reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupView() {
        title = "Pokemons"
        viewModel.getPokemons()
        bind()
        
    }
    func setupTableView() {
        tableView.dataSource = self
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    deinit {
        print("    [DEINIT] ->      POKEMONS ViewController")
    }
}

extension PokemonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.getFetch(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokemonTableViewCell else {  fatalError("No se puede cargar la celda PokemonsCell") }
        
        cell.nameLabel.text = item.name.uppercased()
        return cell
    }
    
  
    
}

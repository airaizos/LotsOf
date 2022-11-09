//
//  LinesViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/8/22.
//

import UIKit

final class LinesViewController: UIViewController  {
    
    deinit {
        print("    [DEINIT] ->      LinesViewController")
    }
    //MARK: Variables
    var viewModel = LinesViewModel()
    let searchController = UISearchController()
    var filteredLines = [String]()
    
    //MARK: Outlets
    @IBOutlet weak var linesTableView: UITableView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        initSearchController()
    }
    
    //MARK: Functions
    private func setupView() {
      //  view.backgroundColor = .systemRed
        viewModel.delegate = self
    }
    
    private func setupTableView() {
        
        linesTableView.dataSource = self
        linesTableView.delegate = self
        linesTableView.reloadData()
        viewModel.getLines()
        bind()
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.linesTableView.reloadData()
            }
        }
    }
    
    private func initSearchController() {
        //TODO: Porque no se muestra los buttonTitles al seleccionar la barra de busqueda?
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["Todas","Urbano","C","N","Barrios"]
        searchController.searchBar.delegate = self
    }
}

//MARK: Extensions
extension LinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive) {
            return filteredLines.count
        } else {
            return viewModel.busLines.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellViewModel = viewModel.cellViewModel(at: indexPath)
      

        if (searchController.isActive) {
            cellViewModel = filteredLines[indexPath.row]
        } else {
            cellViewModel = viewModel.busLines[indexPath.row]
        }
        
        
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

extension LinesViewController:  UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "Todas") {
        filteredLines = viewModel.busLines.filter {
            lineLink in
            let line = lineLink.separateBusLineName
            var scopeMatch = (scopeButton == "Todas" || (line.contains(scopeButton.lowercased())))
            
            if scopeButton == "Barrios" {
                scopeMatch = line.lowercased().contains("r")
                
            } else if scopeButton == "C" {
                scopeMatch = line.lowercased().starts(with:"c")
                    
            } else if scopeButton == "N" {
                    scopeMatch = line.lowercased().starts(with:"n")
                
            } else if scopeButton == "Urbano" {
                scopeMatch = line.count == 2
                
            }

            
            if (searchController.searchBar.text != "") {
                let searchTextMatch = line.lowercased().contains(searchText.lowercased())
                return scopeMatch && searchTextMatch
            } else {
                return scopeMatch
            }
        }
        linesTableView.reloadData()
    }
}

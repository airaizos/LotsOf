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
      
        
    //    let thisLine: String!
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
    
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "All") {
        filteredLines = viewModel.busLines.filter {
            line in
            
            
            let scopeMatch = (scopeButton == "All" || (line.lowercased().contains(scopeButton.lowercased())))
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

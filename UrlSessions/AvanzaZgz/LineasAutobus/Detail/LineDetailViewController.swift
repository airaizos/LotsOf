//
//  LineDetailViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 19/9/22.
//

import UIKit

final class LineDetailViewController: UIViewController {
    var viewModel = LineDetailViewModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        getDetail()
        guard let lineDetail = viewModel.lineDetail else { return }
        
        DispatchQueue.main.async {
            self.titleLabel.text = lineDetail.title
        }
       
        print("lineDetail.title: \(lineDetail.title)")
        viewModel.delegate = self
    }

    
    
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        getDetail()
    }
    
    @IBAction func renameAction(_ sender: UIButton) {
        
        titleLabel.text = viewModel.setCustomTitle()
    }
    
    
    
    deinit {
        print("Deinit LineDetailViewController")
    }
}


extension LineDetailViewController: LineDetailProviderDelegate {
    
    func getDetail() {
      
        guard let lineNumber = viewModel.lineNumber else { return }
        viewModel.fetchDetail(busLineNumber: lineNumber)
    }
}

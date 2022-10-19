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
        getDetail()
        bind()
        setupView()
    }
    
    func setupView() {
      guard let lineDetail = viewModel.lineDetail else { return }
        self.titleLabel.text = lineDetail.title
        print("lineDetail.title: \(lineDetail.title)")
    }

    func bind() {
        viewModel.refreshData = { [weak self] in
            DispatchQueue.main.async {
                self?.setupView()
            }
        }
    }
    
    func getDetail() {
        guard let lineNumber = viewModel.lineNumber else { return }
        viewModel.fetchDetail(busLineNumber: lineNumber)
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        bind()
    }
    
    @IBAction func renameAction(_ sender: UIButton) {
        titleLabel.text = viewModel.setCustomTitle()
    }
    
    

    deinit {
        print("Deinit LineDetailViewController")
    }
}

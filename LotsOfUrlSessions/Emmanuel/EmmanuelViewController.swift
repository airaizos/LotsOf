//
//  EmmanuelViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/9/22.
//

import UIKit

final class EmmanuelViewController: UIViewController {

    let viewModel = EmmanuelViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPosts()
    }
}

//
//  RickAndMortyViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
//

import UIKit

final class RickAndMortyViewController: UIViewController {

    let viewModel = RickAndMortyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.executeRequest()
    }
    

}

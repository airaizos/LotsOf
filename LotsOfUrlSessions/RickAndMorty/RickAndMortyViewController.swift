//
//  RickAndMortyViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 5/9/22.
//

import UIKit

final class RickAndMortyViewController: UIViewController {
    
    let viewModel = RickAndMortyViewModel()
    //   let viewModel = RickAndMortyViewModelAsync()
    
    
    @IBOutlet var loadButton: UIButton!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterFirstEpisodeLabel: UILabel!
    @IBOutlet weak var characterDimensionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      //  viewModel.executeRequest()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: No carga la primera descarga
        viewModel.executeRequest()
        setupViewOne()
        view.layoutSubviews()
    }
    

    
    func setupViewOne() {
        //TODO: Carga el anterior.
        print("setting View...")
      
        characterImage.loadImageUsingCache(withUrl: viewModel.characterBasicInfo.image)
        characterNameLabel.text = viewModel.characterBasicInfo.name
        characterDimensionLabel.text = viewModel.characterBasicInfo.dimension
        characterFirstEpisodeLabel.text = viewModel.characterBasicInfo.firstEpisodeTitle
        view.layoutSubviews()
    }
    
    @IBAction func setupView(_ sender: UIButton) {
        loadButton.addTarget(self, action: #selector(settingNames(_:)), for: .touchUpInside)
    }
    
    @objc private func settingNames(_ sender: UIButton) {
        viewModel.executeRequest()
        setupViewOne()
    }
}

//
//  UsersViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 14/9/22.
//

import UIKit
//TODO: ¿Cómo pasar y que haga otra llamada a Red?
final class ColorsViewController: UIViewController {
    var viewModel = ColorsViewModel()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pantoneLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var colorImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupColor()
    }
    
    
    func setupView() {
        
    }
  
    
    func setupColor() {
        guard let color  = viewModel.color else { return }
        nameLabel.text = color.name
        idLabel.text = "\(color.id)"
        pantoneLabel.text = color.pantoneValue
        yearLabel.text = "\(color.year)"
        colorImage.backgroundColor = UIColor(hex: color.color)
    }
    
    static func create(with color: ColorModel) -> ColorsViewController {
        let viewController =
        UIStoryboard(name: "ColorsViewController", bundle: .main).instantiateViewController(withIdentifier: "ColorsViewController") as! ColorsViewController
        viewController.viewModel.color = color
        return viewController
    }
}

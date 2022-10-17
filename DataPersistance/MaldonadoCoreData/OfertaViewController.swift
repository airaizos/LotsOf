//
//  OfertaViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 15/10/22.
//

import UIKit

final class OfertaViewController: UIViewController {

    let viewModel = OfertaViewModel()
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var modalityPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    

    @IBAction func saveAction(_ sender: UIButton) {
        if let titulo = descriptionTextField.text, let empresa = companyTextField.text, let lugar = cityTextField.text {
            
            let oferta = OfertaModel(image: UIImage(named: "oferta1")!, titulo: titulo, empresa: empresa, favorita: false, fecha: datePicker.date, lugar: lugar, modalidad: .Presencial)
            
            viewModel.saveData(item: oferta)
            navigationController?.popViewController(animated: true)
        } else {
            return //TODO: alerta!
        }
    }
    
    deinit {
        print("    [DEINIT] ->      OFERTA ViewController")
    }
}

//
//  NewTaskViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 31/10/22.
//

import UIKit

final class NewTaskViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var hourTextField: UITextField!
    @IBOutlet weak var minutesTextField: UITextField!
    @IBOutlet weak var secondsTextField: UITextField!
    @IBOutlet weak var nameDescriptionContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Variables
    var taskViewModel: TaskViewModel!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskViewModel = TaskViewModel()
        setupView()
        setupCollectionView()
        setupCounter()
    }
    
    // MARK: - Outlets & objc functions
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
    }
    
    //Cuando se modifica el textField asigna valores
    @objc func textFieldInputChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if (textField == taskNameTextField) {
            taskViewModel.setTaskName(to: text)
            
        } else if (textField == taskDescriptionTextField) {
            taskViewModel.setTaskDescription(to: text)
            
        } else if (textField == hourTextField) {
            guard let hours = Int(text) else { return }
            taskViewModel.setHours(to: hours)
            
        } else if (textField == minutesTextField) {
            guard let minutes = Int(text) else { return }
            taskViewModel.setMinutes(to: minutes)
            
        } else if (textField == secondsTextField) {
            guard let seconds = Int(text) else { return }
            taskViewModel.setSeconds(to: seconds)
        }
        if taskViewModel.isTaskValid() {
            enableButton()
        } else {
           disableButton()
        }
        
    }
    
    override class func description() -> String {
        "NewTaskViewController"
    }
    
    func enableButton() {
        if (startButton.isUserInteractionEnabled == false) {
            
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
                self.startButton.layer.opacity = 1
            } completion: { _ in
                self.startButton.isUserInteractionEnabled.toggle()
            }
        }
    }
    
    func disableButton() {
        if (startButton.isUserInteractionEnabled) {
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
                self.startButton.layer.opacity = 0.25
            } completion: { _ in
                self.startButton.isUserInteractionEnabled.toggle()
            }
        }
        
    }
    
    //Ocultar el teclado
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    //MARK: - Functions
    
    func setupCollectionView () {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: TaskTypeCollectionViewCell.description(), bundle: .main), forCellWithReuseIdentifier: TaskTypeCollectionViewCell.description())
    }
    
    func setupView() {
        self.startButton.layer.cornerRadius = 12
        self.nameDescriptionContainerView.layer.cornerRadius
        = 12
    }
    
    func setupCounter() {
        [hourTextField, minutesTextField, secondsTextField].forEach { $0?.attributedPlaceholder = NSAttributedString(string: "00")
            //Para determinar el número máximo de digitos que se pueden introducir
            $0?.delegate = self
            
            $0?.addTarget(self, action: #selector(textFieldInputChanged(_ :)), for: .editingChanged)
        }
        taskNameTextField.attributedPlaceholder = NSAttributedString(string: "Task Name")
        taskNameTextField.addTarget(self, action: #selector(textFieldInputChanged(_ :)), for: .editingChanged)
        taskDescriptionTextField.attributedPlaceholder = NSAttributedString(string: "Short Description")
        taskDescriptionTextField.addTarget(self, action: #selector(textFieldInputChanged(_ :)), for: .editingChanged)
        
        disableButton()
        
        //Ocultar el teclado
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Self.viewTapped(_ :)))
        //el collectionView deja de poder ser seleccionado, para ello:
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        taskViewModel.getHours().bind { hours in
            self.hourTextField.text = hours.appendZeros()
        }
        
        taskViewModel.getMinutes().bind { minutes in
            self.minutesTextField.text = minutes.appendZeros()
        }
        
        taskViewModel.getSeconds().bind { seconds in
            self.secondsTextField.text = seconds.appendZeros()
        }
        
        
        
    }
    
   
    deinit {
        
        print("    [DEINIT] ->      NEWTASK ViewController")
    }
    
}
// MARK: - Extensions
extension NewTaskViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskViewModel.getTaskTypes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskTypeCollectionViewCell.description(), for: indexPath) as! TaskTypeCollectionViewCell
        
        cell.setupCell(taskType: self.taskViewModel.getTaskTypes()[indexPath.row], isSelected: taskViewModel.getSelectedIndex() == indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 3.75
        let width: CGFloat = collectionView.frame.width
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let adjustWidth = width - (flowLayout.minimumLineSpacing * (columns - 1))
        
        return CGSize(width: adjustWidth / columns, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.taskViewModel.setSelectedIndex(to: indexPath.item)
     //   self.collectionView.reloadData() no es Smooth
        collectionView.reloadSections(IndexSet(0..<1))
    }
    
}


extension NewTaskViewController: UITextFieldDelegate {
    //Determina el número máximo de dígitos a introducir que es 2
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 2
        
        let currentText: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentText.replacingCharacters(in: range, with: string) as NSString
        #warning("NO SE ACTUALIZAN LOS TEXFIELDS DE LOS SEC, MINUTES,HOURS, ALGO FALTA")
        //Para que permita añadir los dos digitos a pesar de la función addZeros()
        guard let text = textField.text else { return false }
        
        if (text.count == 2 && text.starts(with: "0")) {
            textField.text?.removeFirst()
            textField.text? += string
            textFieldInputChanged(textField)
        }
        
        return newString.length <= maxLength
    }
}

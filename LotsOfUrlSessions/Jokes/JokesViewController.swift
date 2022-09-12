//
//  JokesViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import UIKit

final class JokesViewController: UIViewController {
   
    var jokeCategories = "Any" + "?"
    var arrayJokeCategories = [""]
    var jokeSelection = JokeSelection()
    var personalizedJokeURL = "https://v2.jokeapi.dev/joke/"
    

    
    let viewModel = JokesViewModel()
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var jokeParts: UISegmentedControl!
    @IBOutlet weak var languagePickerView: UIPickerView!
    
    /*
    
    //MARK: BlackLists
    @IBOutlet weak var nsfwToggle: UISwitch!
    @IBOutlet weak var religiousToggle: UISwitch!
    @IBOutlet weak var politicalToggle: UISwitch!
    @IBOutlet weak var racitstToggle: UISwitch!
    @IBOutlet weak var sexistToggle: UISwitch!
    @IBOutlet weak var explicitToggle: UISwitch!
    
    //MARK: Categories
    
    @IBOutlet weak var ProgrammingToggle: UISwitch!
    @IBOutlet weak var MiscToggle: UISwitch!
    @IBOutlet weak var DarkToggle: UISwitch!
    @IBOutlet weak var PunToggle: UISwitch!
    @IBOutlet weak var SpokyToggle: UISwitch!
    @IBOutlet weak var ChristmasToggle: UISwitch!
    
    //MARK: Language
    @IBOutlet weak var Language: UIPickerView!
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
  //      viewModel.fetchJoke()
    }

    func setupView() {
        languagePickerView.delegate = self
        languagePickerView.dataSource = self
        
    }
    func setNewJoke() {
        
        jokeSelection.createUrl()
        print(jokeSelection.url)
        
   //     viewModel.fetchJoke()
        categoryLabel.text = viewModel.joke.category
        jokeLabel.text = viewModel.joke.joke
        view.layoutSubviews()
    }
   
    //MARK: Parts
    @IBAction func singleTwoParts(_ sender: UISegmentedControl) {
        jokeSelection.parts = jokeParts.selectedSegmentIndex
    }
    
    //MARK: BlackList
    @IBAction func nsfwToggle(_ sender: UISwitch) {
        jokeSelection.nsfwIsOn = !jokeSelection.nsfwIsOn
    }
    @IBAction func religiousToggle(_ sender: UISwitch) {
        jokeSelection.religiousIsOn = !jokeSelection.religiousIsOn
    }
    @IBAction func politicalToggle(_ sender: UISwitch) {
        jokeSelection.politicalIsOn = !jokeSelection.politicalIsOn
    }
    @IBAction func racistToggle(_ sender: UISwitch) {
        jokeSelection.racistIsOn = !jokeSelection.racistIsOn
    }
    @IBAction func sexistToggle(_ sender: UISwitch) {
        jokeSelection.sexistIsOn = !jokeSelection.sexistIsOn
    }
    @IBAction func explicitToggle(_ sender: UISwitch) {
        jokeSelection.explicitIsOn = !jokeSelection.explicitIsOn
    }
    
    //MARK: Categories
    @IBAction func programmingToggle(_ sender: UISwitch) {
        jokeSelection.programmingIsOn = !jokeSelection.programmingIsOn
    }
    
    @IBAction func miscToggle(_ sender: UISwitch) {
        jokeSelection.miscellaneousIsOn = !jokeSelection.miscellaneousIsOn
    }

    @IBAction func darkToggle(_ sender: UISwitch) {
        jokeSelection.darkIsOn = !jokeSelection.darkIsOn
    }
    @IBAction func punToggle(_ sender: UISwitch) {
        jokeSelection.punIsOn = !jokeSelection.punIsOn
    }
    
    @IBAction func spookyToggle(_ sender: UISwitch) {
        jokeSelection.spookyIsOn = !jokeSelection.spookyIsOn
    }
    @IBAction func christmasToggle(_ sender: UISwitch) {
        jokeSelection.christmasIsOn = !jokeSelection.christmasIsOn
    }
    
    
    

    @IBAction func randomJoke(_ sender: UIButton) {
        setNewJoke()
        print(viewModel.joke.joke)
    }
    
    
    
}


extension JokesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        jokeSelection.languageList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jokeSelection.languageList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        jokeSelection.languageSelection = jokeSelection.languageList[row]
    }
    
    
}

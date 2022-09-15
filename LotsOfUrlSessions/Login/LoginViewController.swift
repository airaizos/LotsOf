//
//  LoginViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 13/9/22.
//

import UIKit

final public class LoginViewController: UIViewController {

   // public init() {}
    public var authenticationViewModel = LoginViewModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    public override func viewDidLoad() {
        super.viewDidLoad()

       setupView()
    }
    
    func setupView() {
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        authenticationViewModel.loginWith(email: email, password: password)
       //No espera la respuesta
        showAlert()
        
    }
    
    func showAlert() {
        let alertTitle = authenticationViewModel.loginStatus == .error ? "Password Error" : "Login success"
        
        let alert = UIAlertController(title: alertTitle, message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    /*
    func getModuleStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: .module)
        return storyboard
    }
    */
}

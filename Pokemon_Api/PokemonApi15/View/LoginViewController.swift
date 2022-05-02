//
//  LoginViewController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 02/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let controller = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func goToPokemonList() {
        if let listView = self.storyboard?.instantiateViewController(withIdentifier: controller.pokemonList) {
            self.present(listView, animated: true, completion: nil)
        }
    }
    
    func errorMessage() {
        let alert = UIAlertController(title: controller.alert, message: controller.message, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.button, style: .destructive) { [weak self] button in
            self?.emailTextField.text = ""
            self?.passwordTextField.text = ""
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func myLoginRequest() {
        let user = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        controller.requestLoginController(user: user, password: password) { [weak self] success in
            if success {
                self?.goToPokemonList()
            } else {
                self?.errorMessage()
            }
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        myLoginRequest()
    }
}

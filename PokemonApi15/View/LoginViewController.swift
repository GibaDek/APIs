//
//  LoginViewController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 24/04/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let controller = LoginRequestController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        myRequest()
    }
    
    func myRequest() {
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
    
    func goToPokemonList() {
        if let pokemonListView = self.storyboard?.instantiateViewController(withIdentifier: controller.listView) {
            self.present(pokemonListView, animated: true, completion: nil)
        }
    }
    
    func errorMessage() {
        let alert = UIAlertController(title: controller.alert, message: controller.message, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.button, style: .destructive) { button in
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
}

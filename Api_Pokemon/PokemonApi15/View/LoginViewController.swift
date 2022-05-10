//
//  LoginViewController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 09/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let controller = ControllerLogin()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func goToPokemonList() {
        if let nextScreen = self.storyboard?.instantiateViewController(withIdentifier: controller.listView) {
            nextScreen.modalPresentationStyle = .fullScreen
            self.present(nextScreen, animated: true, completion: nil)
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
    
    @IBAction func loginButton(_ sender: Any) {
        myRequest()
    }
}





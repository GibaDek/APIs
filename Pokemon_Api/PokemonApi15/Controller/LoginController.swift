//
//  LoginController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 02/05/22.
//

import UIKit

class LoginController: NSObject {
    let pokemonList = "listView"
    let alert = "Alerta!"
    let message = "Usuário ou senha inválidos"
    let button = "OK"
    let myRequest = RequestLogin()
    
    func requestLoginController(user: String, password: String, completion: @escaping(Bool) -> Void) {
        myRequest.requestLogin(user: user, password: password) { success in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

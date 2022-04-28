//
//  LoginRequestController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 23/04/22.
//

import UIKit

class LoginRequestController: NSObject {
    let button = "OK"
    let alert = "Alerta!"
    let message = "Usuário ou Senha inválidos!"
    let listView = "listView"
    let myRequest = LoginRequest()
    
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

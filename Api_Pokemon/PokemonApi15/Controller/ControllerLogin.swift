//
//  ControllerLogin.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 09/05/22.
//

import UIKit

class ControllerLogin: NSObject {
    let alert = "Alerta!"
    let button = "OK"
    let message = "Usuário ou senha inválidos!"
    let listView = "listView"
    let myRequestLogin = requestLogin()
    
    func requestLoginController(user: String, password: String, completion: @escaping(Bool) -> Void) {
        myRequestLogin.requestLoginView(user: user, password: password) { success in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

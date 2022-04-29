//
//  LoginRequest.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 23/04/22.
//

import UIKit
import Alamofire

class LoginRequest: NSObject {
    let baseUrl = "https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/signin"
    
    func requestLogin(user: String, password: String, completion: @escaping(Bool) -> Void) {
        
        let param = ["email": user, "password": password]
        AF.request(baseUrl, method: .post, parameters: param, encoder: JSONParameterEncoder.default).responseJSON { response in
            if response.response?.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

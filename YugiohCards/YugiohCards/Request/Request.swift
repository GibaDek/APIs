//
//  Request.swift
//  YugiohCards
//
//  Created by Gilberto Amaro on 30/04/22.
//

import UIKit
import Alamofire

class Request: NSObject {
    let baseUrl = "https://db.ygoprodeck.com/api/v7/cardinfo.php"
    
    func requestYugiCardList(completion: @escaping(YugiCards?, Bool) -> Void) {
        AF.request(baseUrl, method: .get).responseJSON { response in
            if response.response?.statusCode == 200 {
                do {
                    let yugiCards = try JSONDecoder().decode(YugiCards.self, from: response.data ?? Data())
                    completion(yugiCards, true)
                } catch {
                    completion(nil, false)
                }
            } else {
                completion(nil, false)
            }
        }
    }
}

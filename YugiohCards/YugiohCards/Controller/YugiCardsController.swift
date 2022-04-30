//
//  YugiCardsController.swift
//  YugiohCards
//
//  Created by Gilberto Amaro on 30/04/22.
//

import UIKit
import Alamofire

class YugiCardsController: NSObject {
    let button = "OK"
    let message = "Lista Não Encontrada"
    let alert = "Alerta!"
    let cellClass = "YugiCardsTableViewCell"
    let cellIdentifier = "xibCell"
    let myRequest = Request()
    var myYugiCards: YugiCards?
    
    var numberOfRowsInSection: Int {
        return myYugiCards?.data?.count ?? 0
    }
    
    func getYugiByIndex(indexPath: IndexPath) -> Datum? {
        return myYugiCards?.data?[indexPath.row]
    }
    
    func requestController(completion: @escaping(Bool) -> Void) {
        myRequest.requestYugiCardList { [weak self] myCards, success in
            if success {
                self?.myYugiCards = myCards
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

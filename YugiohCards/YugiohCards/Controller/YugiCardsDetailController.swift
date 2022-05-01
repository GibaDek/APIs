//
//  YugiCardsDetailController.swift
//  YugiohCards
//
//  Created by Gilberto Amaro on 01/05/22.
//

import UIKit

class YugiCardsDetailController: NSObject {
    let button = "OK"
    let message = "Card não encontrado"
    let alert = "Alerta!"
    let cellClass = "YugiCardsTableViewCell"
    let cellIdentifier = "xibCell"
    var selectedCard: Datum?
    
    func setSelectedCardDetail(datum: Datum?) {
        self.selectedCard = datum
    }
}

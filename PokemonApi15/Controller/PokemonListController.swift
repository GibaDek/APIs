//
//  PokemonListController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 23/04/22.
//

import UIKit

class PokemonListController: NSObject {
    let message = "Lista não encontrada."
    let alert = "Alerta!"
    let buttonOk = "OK"
    let detailView = "detailView"
    let cellIdentifier = "xibCell"
    let cellClass = "PokemonListTableViewCell"
    let myRequest = Request()
    private var myPokemonList: PokemonList?
    
    var numberOfRowsInSection: Int {
        return myPokemonList?.results?.count ?? 0
    }
    
    func requestController(completion: @escaping(Bool) -> Void) {
        myRequest.requestPokemonList { [weak self] myList, success in
            if success {
                self?.myPokemonList = myList
                completion(true)
            }
        }
    }
    
    func getPokemonByIndex(indexPAth: IndexPath) -> Result? {
        return myPokemonList?.results?[indexPAth.row]
    }
}

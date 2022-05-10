//
//  ControllerPokemonList.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 09/05/22.
//

import UIKit

class ControllerPokemonList: NSObject {
    let detailView = "detailView"
    let alert = "Alerta!"
    let button = "OK"
    let message = "Lista nào encontrada."
    let cellIdentifier = "xibCell"
    let cellClass = "PokemonListTableViewCell"
    let myRequest = requestPokemon()
    private var myPokemonList: PokemonList?
    
    var numberOfRowsPokemon: Int {
        return myPokemonList?.results?.count ?? 0
    }
    
    func getPokemonByIndex(indexPath: IndexPath) -> Result? {
        return myPokemonList?.results?[indexPath.row]
    }
    
    func requestListController(completion: @escaping(Bool) -> Void) {
        myRequest.requestList { [weak self] myList, success in
            if success {
                self?.myPokemonList = myList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

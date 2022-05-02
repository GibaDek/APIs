//
//  PokemonList.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 02/05/22.
//

import UIKit

class PokemonListController: NSObject {
    let detailView = "detailView"
    let cellClass = "PokemonListTableViewCell"
    let cellIdentifier = "xibCell"
    let button = "OK"
    let message = "Lista não encontrada"
    let alert = "Alerta!"
    let myRequest = RequestList()
    private var myPokemonList: PokemonList?
    
    var numberOfRowsInSection: Int {
        return myPokemonList?.results?.count ?? 0
    }
    
    func getPokemonByIndex(indexPath: IndexPath) -> Result? {
        return myPokemonList?.results?[indexPath.row]
    }
    
    func requestListController(completion: @escaping(Bool) -> Void) {
        myRequest.requestPokemonList { [weak self] myList, success in
            if success {
                self?.myPokemonList = myList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

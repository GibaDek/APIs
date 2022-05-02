//
//  DetailPokemonController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 02/05/22.
//

import UIKit

class DetailPokemonController: NSObject {
    let button = "OK"
    let message = "Pokemon não encontrado"
    let alert = "Alerta!"
    let cellIdentifier = "xibCell"
    let cellClass = "PokemonListTableViewCell"
    let myRequest = RequestList()
    private var myDetailPokemon: DetailPokemon?
    var selectedPokemon: Result?
    
    var numberOfRowAbilities: Int {
        return myDetailPokemon?.abilities?.count ?? 0
    }
    
    var numberOfRowGameIndex: Int {
        return myDetailPokemon?.gameIndices?.count ?? 0
    }
    
    var pokemonUrl: String {
        return selectedPokemon?.url ?? ""
    }
    
    var pokemonName: String {
        return myDetailPokemon?.name ?? ""
    }
    
    var pokemonImageUrl: URL? {
        return URL(string: myDetailPokemon?.sprites?.frontDefault ?? "")
    }
    
    func getPokemonAbilitiesById(indexPath: IndexPath) -> Ability? {
        return myDetailPokemon?.abilities?[indexPath.row]
    }
    
    func getPokemonGameIndexById(indexPath: IndexPath) -> GameIndex? {
        return myDetailPokemon?.gameIndices?[indexPath.row]
    }
    
    func setSelectedPokemon(result: Result?) {
        self.selectedPokemon = result
    }
    
    func requestDetail(url: String, completion: @escaping(Bool) -> Void) {
        myRequest.requestDetail(url: url) { [weak self] myList, success in
            if success {
                self?.myDetailPokemon = myList
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

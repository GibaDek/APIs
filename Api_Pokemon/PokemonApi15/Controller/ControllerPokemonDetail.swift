//
//  ControllerPokemonDetail.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 10/05/22.
//

import UIKit

class ControllerPokemonDetail: NSObject {
    let cellClass = "PokemonListTableViewCell"
    let cellIdentifier = "xibCell"
    let alert = "Alerta!"
    let message = "Pokemon não encontrado."
    let button = "OK"
    let myRequest = requestPokemon()
    private var myDetailPokemon: DetailPokemon?
    var selectedPokemon: Result?
    
    var numberOfRowAbilities: Int {
        return myDetailPokemon?.abilities?.count ?? 0
    }
    
    var numberOfRowGameIndex: Int {
        return myDetailPokemon?.gameIndices?.count ?? 0
    }
    
    var pokemonName: String {
        return myDetailPokemon?.name ?? ""
    }
    
    var pokemonUrl: String {
        return selectedPokemon?.url ?? ""
    }
    
    var pokemonImageUrl: URL? {
        return URL(string: myDetailPokemon?.sprites?.frontDefault ?? "")
    }
    
    func setSelectedPokemon(result: Result?) {
        self.selectedPokemon = result
    }
    
    func getPokemonAbilitiesById(indexPAth: IndexPath) -> Ability? {
        return myDetailPokemon?.abilities?[indexPAth.row]
    }
    
    func getPokemonGameIndexById(indexPAth: IndexPath) -> GameIndex? {
        return myDetailPokemon?.gameIndices?[indexPAth.row]
    }
    
    func requestDetailController(url: String, completion: @escaping(Bool) -> Void) {
        myRequest.requestDetail(url: url) { [weak self] myDetail, success in
            if success {
                self?.myDetailPokemon = myDetail
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

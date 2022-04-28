//
//  DetailPokemonController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 23/04/22.
//

import UIKit

class DetailPokemonController: NSObject {
    let cellClass = "PokemonListTableViewCell"
    let cellIdentifier = "xibCell"
    let buttonOk = "OK"
    let alert = "Alerta!"
    let message = "Pokemon não encontrado."
    let myRequest = Request()
    private var myDetailPokemon: DetailPokemon?
    var selectedPokemon: Result?
    
    var pokemonName: String {
        return myDetailPokemon?.name ?? ""
    }
    
    var pokemonUrl: String {
        return selectedPokemon?.url ?? ""
    }
    
    var pokemonImageUrl: URL? {
        return URL(string: myDetailPokemon?.sprites?.frontDefault ?? "")
    }
    
    var numberOfRowPokemonAbilities: Int {
        return myDetailPokemon?.abilities?.count ?? 0
    }
    
    var numberOfRowGameIndex: Int {
        return myDetailPokemon?.gameIndices?.count ?? 0
    }
    
    func getAbilitiesById(indexPAth: IndexPath) -> Ability? {
        return myDetailPokemon?.abilities?[indexPAth.row]
    }
    
    func getGameIndexById(indexPath: IndexPath) -> GameIndex? {
        return myDetailPokemon?.gameIndices?[indexPath.row]
    }
    
    func setSelectedPokemon(result: Result?) {
        self.selectedPokemon = result
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

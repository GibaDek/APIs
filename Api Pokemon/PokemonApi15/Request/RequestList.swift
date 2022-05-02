//
//  RequestList.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 02/05/22.
//

import UIKit
import Alamofire

class RequestList: NSObject {
    let baseUrl = "https://pokeapi.co/api/v2/pokemon"
    
    func requestPokemonList(completion: @escaping(PokemonList?, Bool) -> Void) {
        AF.request(baseUrl, method: .get, parameters: nil).responseJSON { response in
            if response.response?.statusCode == 200 {
                do {
                    let pokemonList = try JSONDecoder().decode(PokemonList.self, from: response.data ?? Data())
                    completion(pokemonList, true)
                } catch {
                    completion(nil, false)
                }
            } else {
                completion(nil, false)
            }
        }
    }
    
    func requestDetail(url: String, completion: @escaping(DetailPokemon?, Bool) -> Void) {
        AF.request(url, method: .get).responseJSON { response in
            if response.response?.statusCode == 200 {
                do {
                    let detailPokemon = try JSONDecoder().decode(DetailPokemon.self, from: response.data ?? Data())
                    completion(detailPokemon, true)
                } catch {
                    completion(nil, false)
                }
            } else {
                completion(nil, false)
            }
        }
    }
}

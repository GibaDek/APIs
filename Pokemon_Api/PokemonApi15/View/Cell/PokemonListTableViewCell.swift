//
//  PokemonListTableViewCell.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 02/05/22.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {
    @IBOutlet weak var myPokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(result: Result?) {
        myPokemonNameLabel.text = result?.name ?? ""
    }
    
    func setupCell(abilities: Ability?) {
        myPokemonNameLabel.text = abilities?.ability?.name ?? ""
    }
    
    func setupCell(gameIndex: GameIndex?) {
        myPokemonNameLabel.text = gameIndex?.version?.name ?? ""
    }
}

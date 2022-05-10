//
//  PokemonListTableViewCell.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 09/05/22.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(result: Result?) {
        pokemonNameLabel.text = result?.name ?? ""
    }
    
    func setupCell(abilities: Ability?) {
        pokemonNameLabel.text = abilities?.ability?.name ?? ""
    }
    
    func setupCell(gameIndex: GameIndex?) {
        pokemonNameLabel.text = gameIndex?.version?.name ?? ""
    }
}

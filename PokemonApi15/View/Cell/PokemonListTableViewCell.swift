//
//  PokemonListTableViewCell.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 23/04/22.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {
    @IBOutlet weak var myPokemonLabelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(object: Result?) {
        myPokemonLabelName.text = object?.name ?? ""
    }
    
    func setupCell(abilities: Ability?) {
        myPokemonLabelName.text = abilities?.ability?.name ?? ""
    }
    
    func setupCell(gameIndex: GameIndex?) {
        myPokemonLabelName.text = gameIndex?.version?.name ?? ""
    }
}

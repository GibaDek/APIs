//
//  PokemonDetailViewController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 10/05/22.
//

import UIKit
import SDWebImage

class PokemonDetailViewController: UIViewController {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var myTableViewAbilities: UITableView!
    @IBOutlet weak var myTableViewGames: UITableView!
    let controller = ControllerPokemonDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRequest()
        xibRegister()
        setupTableView()
        pokemonNameLabel.text = ""
    }
    
    func setupUI() {
        self.myTableViewAbilities.reloadData()
        self.myTableViewGames.reloadData()
        self.pokemonNameLabel.text = controller.pokemonName
        self.pokemonImageView.sd_setImage(with: controller.pokemonImageUrl, completed: nil)
    }
    
    func errorMessage() {
        let alert = UIAlertController(title: controller.alert, message: controller.message, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.button, style: .destructive) { button in
            self.dismiss(animated: true)
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func xibRegister() {
        self.myTableViewAbilities.register(UINib(nibName: controller.cellClass, bundle: nil), forCellReuseIdentifier: controller.cellIdentifier)
        self.myTableViewGames.register(UINib(nibName: controller.cellClass, bundle: nil), forCellReuseIdentifier: controller.cellIdentifier)
    }
    
    func setupTableView() {
        self.myTableViewAbilities.dataSource = self
        self.myTableViewGames.dataSource = self
    }
    
    func myRequest() {
        controller.requestDetailController(url: controller.pokemonUrl) { [weak self] success in
            if success {
                self?.setupUI()
            } else {
                self?.errorMessage()
            }
        }
    }
}

extension PokemonDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableViewAbilities {
            return controller.numberOfRowAbilities
        } else if tableView == myTableViewGames {
            return controller.numberOfRowGameIndex
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == myTableViewAbilities {
            if let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier, for: indexPath) as? PokemonListTableViewCell {
                cell.setupCell(abilities: controller.getPokemonAbilitiesById(indexPAth: indexPath))
                return cell
            }
        } else if tableView == myTableViewGames {
            if let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier, for: indexPath) as? PokemonListTableViewCell {
                cell.setupCell(gameIndex: controller.getPokemonGameIndexById(indexPAth: indexPath))
                return cell
            }
        }
        return UITableViewCell()
    }
}

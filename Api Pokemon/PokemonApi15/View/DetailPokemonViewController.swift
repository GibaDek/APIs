//
//  DetailPokemonViewController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 23/04/22.
//

import UIKit
import SDWebImage

class DetailPokemonViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTableViewAbilities: UITableView!
    @IBOutlet weak var myTableViewGameIndex: UITableView!
    let controller = DetailPokemonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRequest()
        xibRegister()
        setupTableView()
        myLabel.text = ""
    }
    
    func myRequest() {
        controller.requestDetailController(url: controller.pokemonUrl) { [weak self] success in
            if success {
                self?.goToMyPokemonList()
            } else {
                self?.errorMessage()
            }
        }
    }
    
    func goToMyPokemonList() {
        self.myTableViewAbilities.reloadData()
        self.myTableViewGameIndex.reloadData()
        self.myLabel.text = controller.pokemonName
        self.myImageView.sd_setImage(with: controller.pokemonImageUrl, completed: nil)
    }
    
    func errorMessage() {
        let alert = UIAlertController(title: controller.alert, message: controller.message, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.buttonOk, style: .destructive) { button in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func xibRegister() {
        self.myTableViewAbilities.register(UINib(nibName: controller.cellClass, bundle: nil), forCellReuseIdentifier: controller.cellIdentifier)
        self.myTableViewGameIndex.register(UINib(nibName: controller.cellClass, bundle: nil), forCellReuseIdentifier: controller.cellIdentifier)
    }
    
    func setupTableView() {
        self.myTableViewAbilities.dataSource = self
        self.myTableViewGameIndex.dataSource = self
    }
    
}

extension DetailPokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableViewAbilities {
            return controller.numberOfRowPokemonAbilities
        } else if tableView == myTableViewGameIndex {
            return controller.numberOfRowGameIndex
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == myTableViewAbilities {
            if let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier, for: indexPath) as? PokemonListTableViewCell {
                cell.setupCell(abilities: controller.getAbilitiesById(indexPAth: indexPath))
                return cell
            }
        } else if tableView == myTableViewGameIndex {
            if let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier, for: indexPath) as? PokemonListTableViewCell {
                cell.setupCell(gameIndex: controller.getGameIndexById(indexPath: indexPath))
                return cell
            }
        }
        return UITableViewCell()
    }
}


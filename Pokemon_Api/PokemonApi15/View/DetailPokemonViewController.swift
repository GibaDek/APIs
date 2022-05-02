//
//  DetailPokemonViewController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 02/05/22.
//

import UIKit
import SDWebImage

class DetailPokemonViewController: UIViewController {
    @IBOutlet weak var detailPokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var myTableViewAbilities: UITableView!
    @IBOutlet weak var myTableViewGameIndex: UITableView!
    let controller = DetailPokemonController()

    override func viewDidLoad() {
        super.viewDidLoad()
        myRequest()
        xibRegister()
        setupTableView()
        self.pokemonNameLabel.text = ""
    }
    
    func goToDetail() {
        self.myTableViewAbilities.reloadData()
        self.myTableViewGameIndex.reloadData()
        self.pokemonNameLabel.text = controller.pokemonName
        self.detailPokemonImage.sd_setImage(with: controller.pokemonImageUrl, completed: nil)
    }
    
    func alertMessage() {
        let alert = UIAlertController(title: controller.alert, message: controller.message, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.button, style: .destructive) { button in
            self.dismiss(animated: true)
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
    
    func myRequest() {
        controller.requestDetail(url: controller.pokemonUrl) { [weak self] success in
            if success {
                self?.goToDetail()
            } else {
                self?.alertMessage()
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension DetailPokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableViewAbilities {
            return controller.numberOfRowAbilities
        } else if tableView == myTableViewGameIndex {
            return controller.numberOfRowGameIndex
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == myTableViewAbilities {
            if let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier, for: indexPath) as? PokemonListTableViewCell {
                cell.setupCell(abilities: controller.getPokemonAbilitiesById(indexPath: indexPath))
                return cell
            }
        } else if tableView == myTableViewGameIndex {
            if let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier, for: indexPath) as? PokemonListTableViewCell {
                cell.setupCell(gameIndex: controller.getPokemonGameIndexById(indexPath: indexPath))
                return cell
            }
        }
        return UITableViewCell()
    }
}

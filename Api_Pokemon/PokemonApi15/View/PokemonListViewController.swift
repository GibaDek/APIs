//
//  ViewController.swift
//  PokemonApi15
//
//  Created by Gilberto Amaro on 16/04/22.
//

import UIKit

class PokemonListViewController: UIViewController {
    @IBOutlet weak var myPokemonTableView: UITableView!
    let controller = ControllerPokemonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRequest()
        xibRegister()
        setupTableView()
    }
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func myRequest() {
        controller.requestListController { [weak self] success in
            if success {
                self?.pokemonList()
            } else {
                self?.errorMessage()
            }
        }
    }
    
    func pokemonList() {
        self.myPokemonTableView.reloadData()
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
        self.myPokemonTableView.register(UINib(nibName: controller.cellClass, bundle: nil), forCellReuseIdentifier: controller.cellIdentifier)
    }
    
    func setupTableView() {
        self.myPokemonTableView.delegate = self
        self.myPokemonTableView.dataSource = self
    }
}

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRowsPokemon
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier, for: indexPath) as? PokemonListTableViewCell {
            cell.setupCell(result: controller.getPokemonByIndex(indexPath: indexPath))
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nextScreen = self.storyboard?.instantiateViewController(withIdentifier: controller.detailView) as? PokemonDetailViewController {
            nextScreen.controller.setSelectedPokemon(result: controller.getPokemonByIndex(indexPath: indexPath))
            self.present(nextScreen, animated: true, completion: nil)
        }
    }
}


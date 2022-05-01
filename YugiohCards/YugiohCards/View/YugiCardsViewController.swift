//
//  ViewController.swift
//  YugiohCards
//
//  Created by Gilberto Amaro on 30/04/22.
//

import UIKit

class YugiCardsViewController: UIViewController {
    @IBOutlet weak var myCardsListTableView: UITableView!
    let controller = YugiCardsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRequest()
        xibRegister()
        setupTableView()
    }
    
    func myRequest() {
        controller.requestController { [weak self] success in
            if success {
                self?.goToCardsList()
            } else {
                self?.errorMessage()
            }
        }
    }
    
    func goToCardsList() {
        self.myCardsListTableView.reloadData()
    }
    
    func errorMessage() {
        let alert = UIAlertController(title: controller.alert, message: controller.message, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.button, style: .destructive)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func xibRegister() {
        self.myCardsListTableView.register(UINib(nibName: controller.cellClass, bundle: nil), forCellReuseIdentifier: controller.cellIdentifier)
    }
    
    func setupTableView() {
        self.myCardsListTableView.delegate = self
        self.myCardsListTableView.dataSource = self
    }
}

extension YugiCardsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier, for: indexPath) as? YugiCardsTableViewCell {
            cell.setupCell(object: controller.getYugiByIndex(indexPath: indexPath))
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailView = self.storyboard?.instantiateViewController(withIdentifier: controller.detailView) as? YugiCardsDetailViewController {
            detailView.controller.setSelectedCardDetail(datum: controller.getYugiByIndex(indexPath: indexPath))
            self.present(detailView, animated: true, completion: nil)
        }
    }
}


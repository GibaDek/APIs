//
//  YugiCardsDetailViewController.swift
//  YugiohCards
//
//  Created by Gilberto Amaro on 01/05/22.
//

import UIKit
import SDWebImage

class YugiCardsDetailViewController: UIViewController {
    @IBOutlet weak var myCardImageView: UIImageView!
    @IBOutlet weak var myCardNameLabel: UILabel!
    @IBOutlet weak var myCardDescriptionLabel: UILabel!
    let controller = YugiCardsDetailController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    
    func setupDetail() {
        let imageUrl = URL(string: controller.selectedCard?.cardImages?.first?.imageURL ?? "")
        myCardImageView.sd_setImage(with: imageUrl, completed: nil)
        myCardNameLabel.text = controller.selectedCard?.name ?? ""
        myCardDescriptionLabel.text = controller.selectedCard?.desc ?? ""
    }
}

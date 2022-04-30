//
//  YugiCardsTableViewCell.swift
//  YugiohCards
//
//  Created by Gilberto Amaro on 30/04/22.
//

import UIKit
import SDWebImage

class YugiCardsTableViewCell: UITableViewCell {
    @IBOutlet weak var myCardImageView: UIImageView!
    @IBOutlet weak var myCardLabelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(object: Datum?) {
        let imageUrl = URL(string: object?.cardImages?.first?.imageURL ?? "")
        myCardImageView.sd_setImage(with: imageUrl, completed: nil)
        myCardLabelName.text = object?.name ?? ""
    }
}

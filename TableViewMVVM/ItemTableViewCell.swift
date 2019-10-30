//
//  ItemTableViewCell.swift
//  TableViewMVVM
//
//  Created by camilo andres ibarra yepes on 30/10/19.
//  Copyright © 2019 camilo andres ibarra yepes. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemIndexLabel: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupDataFromModel(model: Model) {
        self.itemNameLabel.text = model.itemName
        self.itemIndexLabel.text = model.itemIndex
    }
    
}

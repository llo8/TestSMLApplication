//
//  ItemTableViewCell.swift
//  TestSML
//
//  Created by Юрий on 18.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var indexLabel: UILabel!
    @IBOutlet var indexButton: FilledButton!
    
    func setup(_ item: ListItem) {
        indexLabel.text = "\(item.indexItem)"
        
        indexButton.fillPath = item.pathFill
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

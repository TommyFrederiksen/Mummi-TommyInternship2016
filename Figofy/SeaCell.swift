//
//  SeaCell.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 02/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class SeaCell: UITableViewCell {

    @IBOutlet weak var seaName: UILabel!
    @IBOutlet weak var seaAddress: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell (sea: Sea) {
        seaName.text = sea.name
        seaAddress.text = sea.address
    }
    
}

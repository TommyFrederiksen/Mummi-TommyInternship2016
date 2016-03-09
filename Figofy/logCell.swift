//
//  logCell.swift
//  Figofy
//
//  Created by Tommy on 08/03/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class logCell: UITableViewCell {

    
    @IBOutlet weak var logImageView: UIImageView!
    @IBOutlet weak var agnLabel: UILabel!
    @IBOutlet weak var artLabel: UILabel!
    @IBOutlet weak var beskrivelseLabel: UILabel!
    @IBOutlet weak var metodeLabel: UILabel!
    @IBOutlet weak var længdeLabel: UILabel!
    @IBOutlet weak var vægtLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func configureCell(image: UIImage,agn: String,art: String,beskrivelse: String,metode:String,længde: String,vægt: String)
    {
        logImageView.image = image
        agnLabel.text = agn
        artLabel.text = art
        beskrivelseLabel.text = beskrivelse
        metodeLabel.text = metode
        længdeLabel.text = længde
        vægtLabel.text = vægt
    }
    

}

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

   
    func configureCell(fish: Fish)
    {
        let img = decodeBase64StringToImage(fish.imageStr)
        
        logImageView.image = img
        agnLabel.text = fish.bait
        artLabel.text = fish.species.description
        beskrivelseLabel.text = fish.note
        metodeLabel.text = fish.method
        længdeLabel.text = "\(fish.length)"
        vægtLabel.text = "\(fish.weight)"
    }
    func decodeBase64StringToImage(strEncodedData: String?) -> UIImage {
        if let data = strEncodedData{
            let image = NSData(base64EncodedString: data, options: .IgnoreUnknownCharacters)
            return UIImage(data: image!)!
        }
        else
        {
            return UIImage(named: "Figofy_app_trans")!
        }
        
    }
    

}
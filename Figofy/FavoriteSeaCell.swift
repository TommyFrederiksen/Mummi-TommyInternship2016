//
//  FavoriteSeaCell.swift
//  Figofy
//
//  Created by Tommy on 26/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class FavoriteSeaCell: UICollectionViewCell {
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(image: UIImage, text: String){
        mainImg.image = image
        mainLbl.text = text
        
    }
}
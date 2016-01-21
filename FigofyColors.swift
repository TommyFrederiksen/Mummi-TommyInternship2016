//
//  FigofyColors.swift
//  Figofy
//
//  Created by Tommy on 20/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation
import UIKit

let FigofyBorderColor = UIColor(red: 51/255, green: 51/255, blue: 153/255, alpha: 1).CGColor


func FigofyTextField(sender: UITextField){
    sender.layer.borderWidth = 2
    sender.layer.cornerRadius = 10
    sender.layer.borderColor = FigofyBorderColor
    
}
func FigofyButton(sender: UIButton){
    sender.layer.backgroundColor = FigofyBorderColor
    sender.setTitleColor(UIColor .whiteColor(), forState: UIControlState.Normal)
    
    sender.layer.borderWidth = 2
    sender.layer.cornerRadius = 10
    sender.layer.borderColor = FigofyBorderColor
    
}



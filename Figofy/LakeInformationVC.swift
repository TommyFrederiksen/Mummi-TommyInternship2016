//
//  LakeInformationVC.swift
//  Figofy
//
//  Created by Tommy on 21/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit


class LakeInformationVC: UIViewController {
    
 
    // MARK: IBOutlets
    
    
    // MARK: Variables
    var sea: Sea!
    
    
    // MARK: View Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

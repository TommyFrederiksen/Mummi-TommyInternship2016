//
//  ProfileViewController.swift
//  Figofy
//
//  Created by Tommy on 21/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageBtn: UIButton!
    @IBOutlet weak var editImageBtn: UIButton!
    
    
    @IBOutlet weak var firstName: UILabel!
    var user: FigofyUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Test()
        firstName.text = user.userFirstName
        
        
    }
    func Test(){
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
        profileImageView.clipsToBounds = true
        backgroundImageBtn.layer.cornerRadius = backgroundImageBtn.layer.frame.width/2
        
    }
    
    
    
    
    
    
    
    
}

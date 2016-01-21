//
//  CreateUserViewController.swift
//  Figofy
//
//  Created by Tommy on 20/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit


class CreateUserViewController: UIViewController {
    
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var firstnameTextField: UITextField!
 
    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
 
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FigofyTextField(usernameTextField)
        FigofyTextField(firstnameTextField)
        FigofyTextField(lastnameTextField)
        FigofyTextField(passwordTextField)
        FigofyTextField(emailTextField)
        FigofyTextField(confirmPasswordTextField)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

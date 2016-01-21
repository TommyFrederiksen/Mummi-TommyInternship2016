//
//  ViewController.swift
//  Figofy
//
//  Created by Tommy on 31/12/2015.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
 
    @IBOutlet weak var passwordTextField: UITextField!
    
    let Users = [["Søren","Figofy"],["Kim","Figofy"],["Tommy","Figofy"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameTextField.layer.borderWidth = 0.5
        usernameTextField.layer.borderColor = UIColor.yellowColor().CGColor
        
        
    }
    @IBAction func Login(sender: AnyObject)
    {
        let username = usernameTextField.text;
        let password = passwordTextField.text;
        
       
        
        //empty fields in login
        if(username == "" || password == "")
        {
            
            let uiAlert = UIAlertController(title: "OBS", message: "Username & Password kan ikke være tomme", preferredStyle: UIAlertControllerStyle.Alert)
            
            uiAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(action: UIAlertAction!) in self.navigationController?.popToRootViewControllerAnimated(true)}))
            
            self.presentViewController(uiAlert, animated: true, completion: nil)
            
            
            
        }
        var indicator = false;
        
        for (name) in Users{
            if (name.contains(username!))
            {
                if(name.contains(password!))
                {
                    indicator = true;
                }
                if(name.contains(password!) == false)
                {
                }
            }
            else
            {
            }
        }
        if(password == username)
        {
            indicator = false;
        }
        
        if(indicator == false)
        {
            let uiAlert = UIAlertController(title: "OBS", message: "login fejlede", preferredStyle: UIAlertControllerStyle.Alert)
            
            uiAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(action: UIAlertAction!) in self.navigationController?.popToRootViewControllerAnimated(true)}))
            
            self.presentViewController(uiAlert, animated: true, completion: nil)
        }
        
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


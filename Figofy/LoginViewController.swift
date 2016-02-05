//
//  LoginViewController.swift
//  Figofy
//
//  Created by Tommy on 31/12/2015.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {

    //MARK: IBOutlets
    @IBOutlet weak var usernameTextField: TextFieldDesign!
    @IBOutlet weak var passwordTextField: TextFieldDesign!
    
    
    // MARK: Variables
    let layer = CAGradientLayer()
    let Users = [["Søren","Figofy"],["Kim","Figofy"],["Tommy","Figofy"],["Mummi","Figofy"],["Figofy","Figofy"]]
    
    // MARK: View Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        
        
    }
    
    // MARK: Custom Methods
    func login(){
        //empty fields in login
        if(usernameTextField.text == "" || passwordTextField.text == "")
        {
            
            let uiAlert = UIAlertController(title: "OBS", message: "Username & Password kan ikke være tomme", preferredStyle: UIAlertControllerStyle.Alert)
            
            uiAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler:
                {(action: UIAlertAction!) in self.navigationController?.popToRootViewControllerAnimated(true)
            }))
            
            self.presentViewController(uiAlert, animated: true, completion: nil)
            view.endEditing(true)
            
            
            
        }
        var indicator = false;
        
        for (name) in Users
        {
            if (name.contains(usernameTextField.text!))
            {
                if(name.contains(passwordTextField.text!))
                {
                    indicator = true;
                    performSegueWithIdentifier("Login", sender: self)
                }
            }
            else
            {
            }
        }
        if(passwordTextField.text == usernameTextField)
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
    
    
    // MARK: Delegate Methods
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
        
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.tag == 1 {
            passwordTextField.becomeFirstResponder()
        } else if textField.returnKeyType == UIReturnKeyType.Go {
            login()
        }
        
        return true
    }
    
    
    //MARK: IBAction
    @IBAction func Login(sender: AnyObject)
    {
        login()
    }
   

}


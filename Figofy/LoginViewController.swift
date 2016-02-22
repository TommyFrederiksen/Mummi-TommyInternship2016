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
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var figofyLogo: UIImageView!
    @IBOutlet weak var profilephotoView: UIImageView!
    
    @IBOutlet weak var fortrydBtn: UIButton!
    @IBOutlet weak var opretBtn: UIButton!
    
    @IBOutlet weak var opretprofilUsername: TextFieldDesign!
    @IBOutlet weak var opretprofilPassword: TextFieldDesign!
    @IBOutlet weak var opretprofilEmail: TextFieldDesign!
    @IBOutlet weak var opretprofilPhone: TextFieldDesign!
    
    @IBOutlet weak var buttomBar: UIStackView!
    // MARK: Variables
    let layer = CAGradientLayer()
    let Users = [["Søren","Figofy"],["Kim","Figofy"],["Tommy","Figofy"],["Mummi","Figofy"],["Figofy","Figofy"]]
    
    // MARK: View Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        loginbtn.layer.cornerRadius = 50
        opretBtn.layer.cornerRadius = opretBtn.frame.width/2
        fortrydBtn.layer.cornerRadius = fortrydBtn.frame.width/2
        profilephotoView.layer.cornerRadius = 75
        profilephotoView.clipsToBounds = true

        
        
        
        
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
   
    @IBOutlet weak var opretSV: UIStackView!
    @IBAction func OpretProfil(sender: AnyObject) {
        usernameTextField.hidden = true
        passwordTextField.hidden = true
        loginbtn.hidden = true
        figofyLogo.hidden = true
        profilephotoView.hidden = false
        
        opretSV.hidden = false
        buttomBar.hidden = true
        
    }

    @IBAction func FortrydOpret(sender: AnyObject) {
        usernameTextField.hidden = false
        passwordTextField.hidden = false
        loginbtn.hidden = false
        figofyLogo.hidden = false
        profilephotoView.hidden = true
        
        opretSV.hidden = true
        buttomBar.hidden = false
    }
    @IBAction func OpretProfiel(sender: AnyObject) {
    }
}


//
//  LoginViewController.swift
//  Figofy
//
//  Created by Tommy on 31/12/2015.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //MARK: IBOutlets
    @IBOutlet weak var usernameTextField: TextFieldDesign!
    @IBOutlet weak var passwordTextField: TextFieldDesign!
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var figofyLogo: UIImageView!
    @IBOutlet weak var profilephotoView: UIImageView!
    
    @IBOutlet weak var fortrydBtn: UIButton!
    @IBOutlet weak var opretBtn: UIButton!
    
    @IBOutlet weak var createUsername: TextFieldDesign!
    @IBOutlet weak var createPassword: TextFieldDesign!
    @IBOutlet weak var createEmail: TextFieldDesign!
    @IBOutlet weak var createPhone: TextFieldDesign!
    
    @IBOutlet weak var opretSV: UIStackView!
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //grab the key and if it is there, login automatically
//        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
//            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
//        }
    }
    
    
    //MARK: IBAction
    //FACEBOOK
    @IBAction func fbLogin(sender: UIButton)
    {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler: { facebookResult, facebookError -> Void in
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else {
                //get the access token for Firebase
                let accessToken = FBSDKAccessToken.currentAccessToken()
                print("Successfully logged in with facebook. \(accessToken)")
                
                DataService.dataService.REF_BASE.authWithOAuthProvider("facebook", token: accessToken.tokenString, withCompletionBlock: { error, authData in
                    
                    //store the information in Firebase
                    if error != nil {
                        print("Login Failed. \(error)")
                    } else {
                        print("Logged In! \(authData)")
                        //save it to the device
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        //save to firebase
                        var graphConnection = FBSDKGraphRequestConnection()
                        
                        if accessToken.hasGranted("") {
                            
                        }
//                        FBSDKGraphRequest(graphPath: "me?fields=id,name,picture", parameters: nil).startWithCompletionHandler({ connection, result, error in
//                            
//                            if error != nil {
//                                print("couldnt get information about user: \(error)")
//                            } else {
//                                
//                                print("Information about the user: \(result)")
//                                print("CONNECTION: \(connection)")
//                            }
//                            
//                        })
                        
//                        let user = ["provider" : authData.provider!]
//                        DataService.dataService.createFirebaseUser(authData.uid, user: user)
//                        
                        //Navigate through
                        self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    }
                    
                })
                
                
            }
        })
    }
    
    @IBAction func registerBtnPressed(sender: AnyObject) {
        usernameTextField.hidden = true
        passwordTextField.hidden = true
        loginbtn.hidden = true
        figofyLogo.hidden = true
        profilephotoView.hidden = false
        
        opretSV.hidden = false
        buttomBar.hidden = true
        
    }
    
    @IBAction func createBtnPressed (sender: UIButton) {
        
        if let email = createEmail.text where email != "", let pwd = createPassword.text where pwd != "" {
            
            DataService.dataService.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                
                if error != nil {
                    
                    print(error)
                    
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        DataService.dataService.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: { error, result in
                            
                            if error != nil {
                                AlertView().showOkayAlert("Could not create account", message:  "Problem Creating Account. Try something else", style: .Alert, VC: self)
                            } else {
                                //Save user and log in
                                NSUserDefaults.standardUserDefaults().setValue(result[KEY_UID], forKey: KEY_UID)
                                
                                DataService.dataService.REF_BASE.authUser(email, password: pwd, withCompletionBlock: nil)
                                
                                self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                            }
                            
                        })
                    } else {
                        AlertView().showOkayAlert("Could not login", message:  "Please check your username or password", style: .Alert, VC: self)
                    }
                    
                } else {
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                }
                
            })
            
        } else {
            AlertView().showOkayAlert("Email and Password Required", message: "you must enter an email and a password", style: .Alert, VC: self)
        }
        
    }
    

    @IBAction func cancelBtnPressed (sender: AnyObject) {
        usernameTextField.hidden = false
        passwordTextField.hidden = false
        loginbtn.hidden = false
        figofyLogo.hidden = false
        profilephotoView.hidden = true
        
        opretSV.hidden = true
        buttomBar.hidden = false
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
            
        }
        
        return true
    }
}


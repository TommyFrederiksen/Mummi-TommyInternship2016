//
//  RegisterFishVC.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 26/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class RegisterFishVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var fishImg: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var speciesTxt: UITextField!
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var lengthTxt: UITextField!
    @IBOutlet weak var reelTxt: UITextField!
    @IBOutlet weak var baitTxt: UITextField!
    @IBOutlet weak var fishingLineTxt: UITextField!
    @IBOutlet weak var jigsTxt: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
        
        fishImg.layer.cornerRadius = 2.5
        uploadButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func uploadPressed(sender: AnyObject) {
        
        AlertView().showYesNoAlert("Post To Facebook", message: "Would you like to post to Facebook also?", style: .Alert, VC: self)
        
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
        //still able to change pic
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        //take you back to the other screen
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //when user taps on image it returns it
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        //save image
        fishImg.image = image
    }
    
    

}

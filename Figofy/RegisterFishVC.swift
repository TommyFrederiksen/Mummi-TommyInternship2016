//
//  RegisterFishVC.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 26/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class RegisterFishVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    // MARK: IBOutlets Txt Entry
    @IBOutlet weak var fishImg: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    
    // MARK: PickerViews
    var fishAttPicker: UIPickerView!
    
    
    // MARK: Variables
    var imagePicker: UIImagePickerController!
    
    var fishCatched: FishCatch!
    var fish: Fish!
    var fishSpecies = [Int]()
    var fishLength = [Int]()
    
    var currentTextField: UITextField!
    var currentArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        fishAttPicker = UIPickerView()
        fishAttPicker.delegate = self
        // Do any additional setup after loading the view.
        
        fishImg.layer.cornerRadius = 2.5
        uploadButton.layer.cornerRadius = 5
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextField Delegate Methods
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true)
    }
    
    
    // MARK: UIPickerView delegate Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    // MARK: UIImagePicker delegate methods
    //when user taps on image it returns it
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        //save image
        fishImg.image = image
    }
    

    // MARK: IBActions
    @IBAction func uploadPressed(sender: AnyObject) {
        
        AlertView().showYesNoAlert("Post To Facebook", message: "Would you like to post to Facebook also?", style: .Alert, VC: self)
        
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
        //still able to change pic
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: Custom methods
    
    
    
    

}

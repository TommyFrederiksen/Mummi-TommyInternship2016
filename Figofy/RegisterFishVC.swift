//
//  RegisterFishVC.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 26/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class RegisterFishVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var fishImg: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var chooseSpecies: UIButton!
    @IBOutlet weak var chooseWeight: UIButton!
    @IBOutlet weak var chooseLength: UIButton!
    @IBOutlet weak var chooseBait: UIButton!
    
    var imagePicker: UIImagePickerController!
    // MARK: PickerViews
    @IBOutlet weak var speciesPicker: UIPickerView!
    @IBOutlet weak var weightPicker: UIPickerView!
    @IBOutlet weak var lengthPicker: UIPickerView!
    @IBOutlet weak var baitPicker: UIPickerView!
    
    var currentPicker: UIPickerView!
    
    // MARK: Variables
    var currentArray = []
    var speciesArray = ["Laks","GuldLaks","Torsk","Hvilling","Lange", "Abore"]
    var kgArray: [Int] = []
    var gArray: [Int] = []
    var weightArray: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        speciesPicker.delegate = self
        speciesPicker.hidden = true
        weightPicker.delegate = self
        weightPicker.hidden = true
        lengthPicker.delegate = self
        lengthPicker.hidden = true
        baitPicker.delegate = self
        // Do any additional setup after loading the view.
        
        fishImg.layer.cornerRadius = 2.5
        uploadButton.layer.cornerRadius = 5
        kgArray += 0..<100
        gArray += 0..<10
        weightArray = [kgArray,gArray]
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesBegan(touches, withEvent: event)
        if let picker = currentPicker {
            picker.hidden = true
        }
        view.endEditing(true)
    }
    
    
    // MARK: UIPickerView delegate Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == speciesPicker {
            return 1
        } else if pickerView == weightPicker {
            return 2
        } else if pickerView == lengthPicker {
            return 2
        } else if pickerView == baitPicker {
            return 1
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == speciesPicker  {
            return speciesArray.count
        } else if pickerView == weightPicker {
            return weightArray[component].count
        }
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == speciesPicker {
            return "\(speciesArray[row])"
        } else if pickerView == weightPicker {
            return "\(weightArray[component][row])"
        } else if pickerView == lengthPicker {
            return "ass"
        } else if pickerView == baitPicker {
            return "fdfd"
        }
        return "FAIL"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == speciesPicker {
            chooseSpecies.setTitle("\(speciesArray[row])", forState: .Normal)
        } else if pickerView == weightPicker {
            
            let kg = weightPicker.selectedRowInComponent(weightArray[0][0])
            let grams = weightPicker.selectedRowInComponent(weightArray[1][1])
            chooseWeight.setTitle("\(kg),\(grams)", forState: .Normal)
        } else if pickerView == lengthPicker {
            chooseSpecies.setTitle("22", forState: .Normal)
        } else if pickerView == baitPicker {
            chooseSpecies.setTitle("2fdf", forState: .Normal)
        }
        
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
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
        //still able to change pic
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
   
    @IBAction func chooseTapped(sender: UIButton) {
        if sender.tag == 0 {
            //Species stuff
            if currentPicker != speciesPicker {
                currentPickerNotNill(currentPicker)
                currentPicker = speciesPicker
                currentPicker.hidden = false
            } else {
                currentPicker.hidden = false
            }
        } else if sender.tag == 1 {
            //Weight stuff
            if currentPicker != weightPicker {
                currentPickerNotNill(currentPicker)
                currentPicker = weightPicker
                weightPicker.hidden = false
            } else {
                currentPicker.hidden = false
            }
        } else if sender.tag == 2 {
            //Length stuff
        } else if sender.tag == 3 {
            //Bait stuff
        }
    }
    
    // MARK: Custom methods
    func currentPickerNotNill(pickerView: UIPickerView?) {
        if let picker = currentPicker {
            picker.hidden = true
        }
    }
    
    
    

}

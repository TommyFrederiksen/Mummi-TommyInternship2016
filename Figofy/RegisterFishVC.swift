//
//  RegisterFishVC.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 26/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

enum Decimals: Double {
    case One = 0.1
    case Two = 0.2
    case Three = 0.3
    case Four = 0.4
    case Five = 0.5
    case Six = 0.6
    case Seven = 0.7
    case Eight = 0.8
    case Nine = 0.9
    
}

class RegisterFishVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UITextFieldDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var fishImg: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var chooseSpecies: UILabel!
    @IBOutlet weak var chooseWeight: UILabel!
    @IBOutlet weak var chooseLength: UILabel!
    @IBOutlet weak var chooseMethod: UILabel!
    @IBOutlet weak var writeBait: UITextField!
   
    
    var imagePicker: UIImagePickerController!
    // MARK: PickerViews
    @IBOutlet weak var speciesPicker: UIPickerView!
    @IBOutlet weak var weightPicker: UIPickerView!
    @IBOutlet weak var lengthPicker: UIPickerView!
    @IBOutlet weak var methodPicker: UIPickerView!
    
    var currentPicker: UIPickerView!
    
    // MARK: Variables
    var imageSelected = false
    
    var currentArray = []
    var speciesArray = ["Laks","GuldLaks","Torsk","Hvilling","Lange", "Abore"]
    var kgArray: [Int] = []
    var gArray: [Int] = []
    var weightArray: [[Int]] = []
    var mArray: [Int] = []
    var cmArray: [Int] = []
    var lengthArray: [[Int]] = []
    var methodArray = ["Agnfiskeri","Geddefiskeri","Spinnefiskeri","Fluefiskeri","Jigfiskeri","Fiskeri med store softbaits","Trollingfiskeri"]
    
    
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
        methodPicker.delegate = self
        // Do any additional setup after loading the view.
        
        fishImg.layer.cornerRadius = 2.5
        uploadButton.layer.cornerRadius = 5
        
        kgArray += 0..<100
        gArray += 0..<10
        weightArray = [kgArray,gArray]
        mArray += 0..<4
        cmArray += 0..<10
        lengthArray = [mArray,cmArray]
        
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
            return weightArray.count
        } else if pickerView == lengthPicker {
            return lengthArray.count
        } else if pickerView == methodPicker {
            return 1
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == speciesPicker  {
            return speciesArray.count
        } else if pickerView == weightPicker {
            return weightArray[component].count
        } else if pickerView == lengthPicker {
            return lengthArray[component].count
        } else if pickerView == methodPicker {
            return methodArray.count
        }
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == speciesPicker {
            return Fish.Species.init(value: row)?.description
        } else if pickerView == weightPicker {
            return "\(weightArray[component][row])"
        } else if pickerView == lengthPicker {
            return "\(lengthArray[component][row])"
        } else if pickerView == methodPicker {
            return methodArray[row]
        }
        return "FAIL"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == speciesPicker {
            chooseSpecies.text = speciesArray[row]
            
        } else if pickerView == weightPicker {
            let kilos = weightPicker.selectedRowInComponent(weightArray[0][0])
            let grams = weightPicker.selectedRowInComponent(weightArray[1][1])
            
            chooseWeight.text = "\(kilos).\(grams)"
            
        } else if pickerView == lengthPicker {
            let m = lengthPicker.selectedRowInComponent(lengthArray[0][0])
            let cm = lengthPicker.selectedRowInComponent(lengthArray[1][1])
            chooseLength.text = "\(m).\(cm)"
            
        } else if pickerView == methodPicker {
            chooseMethod.text = methodArray[row]
        }
        
    }
    
    // MARK: UIImagePicker delegate methods
    //when user taps on image it returns it
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        //save image
        fishImg.image = image
        imageSelected = true
    }
    
    // MARK: UITextField delegate methods
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    // MARK: IBActions
    @IBAction func uploadPressed(sender: AnyObject) {
        
        if let speciesTxt = chooseSpecies.text where speciesTxt != "" && speciesTxt != "Tryk for Art",
           let weightTxt = chooseWeight.text where weightTxt != "" && weightTxt != "Tryk for Vægt",
           let lengthTxt = chooseLength.text where lengthTxt != "" && lengthTxt != "Tryk for Længde",
           let baitTxt = writeBait.text where baitTxt != "" && baitTxt != "Brugt Agn" {
                
            if let img = fishImg.image where imageSelected == true {
                let imgData = encodeToBase64String(img)
                
                postToFirebase(imgData)
                
                
            }
                
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
        //still able to change pic
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
   
    @IBAction func speciesTapped(sender: UITapGestureRecognizer) {
        //Species stuff
        if currentPicker != speciesPicker {
            currentPickerNotNill(currentPicker)
            currentPicker = speciesPicker
            currentPicker.hidden = false
        } else {
            currentPicker.hidden = false
        }
    }
    
    @IBAction func weightTapped(sender: UITapGestureRecognizer) {
        //Weight stuff
        if currentPicker != weightPicker {
            currentPickerNotNill(currentPicker)
            currentPicker = weightPicker
            currentPicker.hidden = false
        } else {
            currentPicker.hidden = false
        }
        
    }
    
    @IBAction func lengthTapped(sender: UITapGestureRecognizer) {
        //Length stuff
        if currentPicker != lengthPicker {
            currentPickerNotNill(currentPicker)
            currentPicker = lengthPicker
            currentPicker.hidden = false
        } else {
            currentPicker.hidden = false
        }
    }
    @IBAction func methodTapped(sender: UITapGestureRecognizer) {
        if currentPicker != methodPicker {
            currentPickerNotNill(currentPicker)
            currentPicker = methodPicker
            currentPicker.hidden = false
        } else {
            currentPicker.hidden = false
        }
    }
   
    // MARK: Custom methods
    func currentPickerNotNill(pickerView: UIPickerView?) {
        if let picker = currentPicker {
            picker.hidden = true
        }
    }
    
    func encodeToBase64String(image: UIImage) -> String {
        return (UIImageJPEGRepresentation(image, 0.2)?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength))!
    }
    
    func postToFirebase(imgData: String) {
        
        let kind: String = chooseSpecies.text!
        let kg = Double(chooseWeight.text!)!
        let m = Double(chooseLength.text!)!
        
        
        let fish: Dictionary<String, AnyObject> = [
            "imageStr" : imgData,
            "length" : m,
            "species" : kind,
            "weight" : kg
        ]
        
        //let firebaseFish = DataService.dataService.REF_FISH.childByAutoId()
        
        //firebaseFish.setValue(fish)
        
        writeBait.text = "Brugt Agn"
        chooseSpecies.text = "Tryk for Vægt"
        chooseLength.text = "Tryk for Længde"
        chooseWeight.text = "Weight"
        imageSelected = false
        fishImg.image = nil
        
    }
    
    
    

}

















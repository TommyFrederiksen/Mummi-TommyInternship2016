//
//  MobilePayViewController.swift
//  Figofy
//
//  Created by Tommy on 21/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class MobilePayViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var payBtn: UIButton!
    @IBOutlet weak var amount: TextFieldDesign!
    
    @IBOutlet weak var serverTimeLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var payment: MobilePayPayment?
    var alert: AlertView?
    let locationManager = CLLocationManager()
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startMonitoringVisits()
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        // Do any additional setup after loading the view, typically from a nib.
        alert = AlertView()
        
        payBtn.layer.cornerRadius = 5.0
        
        getCurrentUsersFish()
        
    }
    
    func getSeas() {
        
        DataService.dataService.REF_SEAS.childByAppendingPath("asdfjhjk2348").observeEventType(.Value, withBlock: { snapshots in
            
            if let prices = snapshots.value.objectForKey("prices") as? Dictionary<String,AnyObject> {
                for (key, value) in prices {
                    print("\(key) Hours for \(value)")
                }
                
            }
            
        })
        
    }
    
    
    func getCurrentUsersFish() {
        
        
        var catches = [Fish]()
        DataService.dataService.REF_USER_CURRENT.childByAppendingPath("fish").observeEventType(.ChildAdded, withBlock: { snaps in
            DataService.dataService.REF_FISH.childByAppendingPath(snaps.key).observeSingleEventOfType(.Value, withBlock: { fish in
                
                print(fish)
            })
//            if let memberSince = snapshots.value.objectForKey("member_since") as? NSTimeInterval? ?? 0 {
//                let date = NSDate.convertFirebaseTimestampToDate(stamp: memberSince)
//                self.serverTimeLbl.text = "\(NSDate.convertToString(time: date, style: NSDateFormatterStyle.MediumStyle))"
//            }
        })
        
    }
    
    func getFish() {
        
        DataService.dataService.REF_FISH.observeEventType(.ChildAdded, withBlock: { snapshots in
            
            if let imageStr = snapshots.value.objectForKey("species") as? String {
                
                
                
            }
            
        })
    }
    
    
    func decodeBase64StringToImage(strEncodeData: String?) -> UIImage {
        if let data = strEncodeData {
            let image = NSData(base64EncodedString: data, options: .IgnoreUnknownCharacters)
            return UIImage(data: image!)!
        } else {
            return UIImage()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        manager.location?.coordinate
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: { placemarks, error in
            
            if let placemark = placemarks {
                
                print("Addresse : \(placemark[0].name), \(placemark[0].postalCode!) \(placemark[0].subLocality) ,\(placemark[0].country)")
            }
            
            
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error While updating location " + error.localizedDescription)
    }
    
    
    @IBAction func payBtnPressed(sender: AnyObject) {
        
        if let price = Float(self.amount.text!) where price >= 0 {
            
            let Id = "3232"
            
            if price >= 0 && Id != "" {
                payment = MobilePayPayment(orderId: Id, productPrice: price)
                MobilePayManager.sharedInstance().beginMobilePaymentWithPayment(payment!) { error in
                    if error.localizedDescription != "" {
                        print(error.localizedDescription)
                    }
                    
                    
                }
                
            }
        }
        
        
        //alert.showOkayAlert("MobilePay Initialized", message: "Switching to MobilePay \(orderId: payment.orderId, transactionId: info.transactionId, info.amountWithdrawnFromCard))", style: .Alert, VC: self)
        
    }
}

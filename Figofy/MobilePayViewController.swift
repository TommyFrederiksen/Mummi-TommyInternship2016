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
        
        
    }
    
    
    func getUsers() {
        
        DataService.dataService.REF_USERS.observeEventType(.ChildAdded, withBlock: { snapshots in
            
            if let memberSince = snapshots.value.objectForKey("member_since") as? NSTimeInterval? ?? 0 {
                let date = NSDate.convertFirebaseTimestampToDate(stamp: memberSince)
                self.serverTimeLbl.text = "\(NSDate.convertToString(time: date, style: NSDateFormatterStyle.MediumStyle))"
            }
            let firstName = snapshots.value.objectForKey("first_name")
            print(firstName)
        })
        
    }
    
    func getFish() {
        
        DataService.dataService.REF_FISH.observeEventType(.ChildAdded, withBlock: { snapshots in
            
            if let imageStr = snapshots.value.objectForKey("length") as? Double? ?? 0.0 {
                print(imageStr)
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
            
            let placemark = placemarks![0]
                
            print("Addresse : \(placemark.name!), \(placemark.postalCode!) \(placemark.subLocality!) ,\(placemark.country!)")
            
            
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

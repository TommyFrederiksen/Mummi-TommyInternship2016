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

class MobilePayViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var payBtn: UIButton!
    @IBOutlet weak var amount: TextFieldDesign!
    
    @IBOutlet weak var serverTimeLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var payment: MobilePayPayment?
    var alert: AlertView?
    var catches = [Fish]()
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
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        alert = AlertView()
        
        payBtn.layer.cornerRadius = 5.0
        
        getFish()
        tableView.reloadData()
    }
    
    func getSeas() {
        
        catches = []
        DataService.dataService.REF_SEAS.childByAppendingPath("asdfjhjk2348").observeEventType(.Value, withBlock: { snapshots in
            
            if let prices = snapshots.value.objectForKey("prices") as? Dictionary<String,AnyObject> {
                for (key, value) in prices {
                    print("\(key) Hours for \(value)")
                }
                
            }
            
        })
        
    }
    
    
    func getCurrentUsersFish() {
        
    
        DataService.dataService.REF_USERS.childByAppendingPath("facebook:10209515104821303").childByAppendingPath("fish").observeEventType(.Value, withBlock: { snapshot in
            
            self.catches = []
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots {
                    DataService.dataService.REF_FISH.childByAppendingPath(snap.key).observeEventType(.Value, withBlock: { fish in
                        
                        if let fishDict = fish.value as? Dictionary<String, AnyObject> {
                            let key = fish.key
                            let currentFish = Fish(postKey: key, dictionary: fishDict)
                            print("\(currentFish.weight)")
                            self.serverTimeLbl.text = currentFish.bait
                            self.catches.append(currentFish)
                        }
                        
                    })
                }
            }
            
        })
        
    }
    
    func getFish() {
        
        DataService.dataService.REF_FISH.observeEventType(.Value, withBlock: { snapshot in
            
            
            self.catches = []
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    print("SNAP: \(snap)")
                    
                    if let fishDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let fish = Fish(postKey: key, dictionary: fishDict)
                        self.serverTimeLbl.text = "\(fish.weight)"
                        self.catches.append(fish)
                    }
                    
                }
                
            }
            
        })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catches.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCellWithIdentifier("fish", forIndexPath: indexPath) as UITableViewCell
        
        let fish = catches[indexPath.row]

        cell.textLabel?.text = fish.bait
        
        return cell
        
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

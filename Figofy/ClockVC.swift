//
//  ClockVC.swift
//  Figofy
//
//  Created by Tommy on 05/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class ClockVC: UIViewController
{
    var payment = MobilePayPayment()
    var manager = MobilePayManager()
    var info = MobilePaySuccessfulPayment()
    
    
    @IBOutlet weak var timerView: Timer!
    @IBOutlet weak var timeLabel: UILabel!
    let clock = Clock()
    
    var timer: NSTimer?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "UpdateTimeLabel",userInfo: nil, repeats: true)
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UpdateTimeLabel()
    }
    
    deinit{
        timer?.invalidate()
    }
    
    func UpdateTimeLabel(){
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        
        if let lbl = timeLabel {
            lbl.text = "Helllo"
            var x: Int = 0
            x++
            print("label isnt nil yet. Number \(x)")
            if let timetxt = timeLabel.text where timetxt != "" {
                print("lbl text is not nil. Number \(x)")
            }
        }
    }
    
    
    
    @IBAction func payWithMobilePay(sender: AnyObject) {
        //alertView.showYesNoAlert("MobilePay Initialized", message: "Switching to MobilePay", style: .Alert, VC: self)
        
        let price = Float(200)
        let Id = "3232"
        
        if price >= 0 && Id != "" {
            payment = MobilePayPayment(orderId: Id, productPrice: price)
            
            MobilePayManager.sharedInstance().beginMobilePaymentWithPayment(payment) { error in
                if error.localizedDescription != "" {
                    print(error.localizedDescription)
                }
                
                
            }
            
        }
        
        
    }
    
}









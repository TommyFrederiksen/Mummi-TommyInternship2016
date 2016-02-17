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
    var alertView = AlertView()
    var payment = MobilePayPayment()
    var manager = MobilePayManager()
    var timer = Timer()
    
    
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    let clock = Clock()
    
    var clockTimer: NSTimer?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clockTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "UpdateTimeLabel",userInfo: nil, repeats: true)
        UpdateTimerView()
        
        
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UpdateTimeLabel()
        
        
    }
    
    deinit{
        clockTimer?.invalidate()
    }
    
    func UpdateTimerView(){
        //timer.bounds = timerView.bounds
        
        
        let timerview = Timer(frame: CGRectMake(timerView.bounds.width/10000 ,timerView.bounds.height/10000 ,300 ,300))
        timerView.addSubview(timerview)
        timerview.animate()
        
        
        
        
        
        
    }
    
        

    
    func UpdateTimeLabel(){
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
      
        timeLabel.text =  formatter.stringFromDate(clock.currentTime)
        
    }
    
    
    
    @IBAction func payWithMobilePay(sender: AnyObject) {
        alertView.showOkayAlert("MobilePay Initialized", message: "Switching to MobilePay", style: .Alert, VC: self)
        //alertView.showYesNoAlert("MobilePay Initialized", message: "Switching to MobilePay", style: .Alert, VC: self)
        
        
        
//        MobilePayManager.sharedInstance().beginMobilePaymentWithPayment(MobilePayPayment(orderId: "1234", productPrice: 1)) { error in
//            
//            
//            
//        }
        
        
    }
    
}









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









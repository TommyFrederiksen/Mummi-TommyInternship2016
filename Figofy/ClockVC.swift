//
//  ClockVC.swift
//  Figofy
//
//  Created by Tommy on 05/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit
import Foundation
class ClockVC: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    
    var payment: MobilePayPayment?
    let clock = Clock()
    var timer: NSTimer?
    var counter: NSTimer?
    var endTime: NSTimer?
    
   
    var timeBought:Int = 0
    
    // MARK: View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimeLabel", userInfo: nil, repeats: true)
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
        updateCounterLabel()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    
    // MARK: Custom Methods
    func updateTimeLabel() {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
    }
    func updateCounterLabel() {
        
        counter = NSTimer.scheduledTimerWithTimeInterval(Double(timeBought * 3600), target: self, selector: "updateCounterLabel", userInfo: nil, repeats: false)
        
        
        
    }
    
    
    @IBAction func KøbTid(sender: AnyObject) {
        
        
            
            let Id = "3232"
            let price = Float(200.00)
        
            if price >= 0 && Id != "" {
                payment = MobilePayPayment(orderId: Id, productPrice: price)
                MobilePayManager.sharedInstance().beginMobilePaymentWithPayment(payment!) { error in
                    if error.localizedDescription != "" {
                        print(error.localizedDescription)
                    }
                    
                    
                }
                
            }
        
        
    }
    
    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }
    
    
}









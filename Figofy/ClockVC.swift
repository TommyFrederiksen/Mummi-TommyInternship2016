//
//  ClockVC.swift
//  Figofy
//
//  Created by Tommy on 05/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class ClockVC: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var payment: MobilePayPayment?
    let clock = Clock()
    var timer: NSTimer?
    
    // MARK: View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimeLabel", userInfo: nil, repeats: true)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
        
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









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
    
    
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    let clock = Clock()
    
    var timer: NSTimer?
    
    let background = UIColor.blackColor()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "UpdateTimeLabel",userInfo: nil, repeats: true)
        
        let circle = Timer()
        self.view = circle
        circle.animate()
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
        
   
        MobilePayManager.sharedInstance().beginMobilePaymentWithPayment(MobilePayPayment(orderId: "1234", productPrice: 1)) { error in
            
            
            
        }
        
        
    }
    
}









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
    let clock = Clock()
    var clockTimer: NSTimer?
    var timeLeft = Timer.duration.animationDuration?.hashValue
    var countDown: NSTimer?
    var TESTSTR: String?
    @IBOutlet weak var timerView: Timer!
    @IBOutlet weak var CountDownClock: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clockTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "UpdateTimeLabel",userInfo: nil, repeats: true)
        
        countDown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Update"), userInfo: nil, repeats: true)
        UpdateTimerView()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UpdateTimeLabel()
    }
    
    deinit{
        clockTimer?.invalidate()
    }
    
    func Update(){
       
        
        
        
        
        
        
      
        
    }
    

    func UpdateTimerView(){
        
        
        
        let color = UIColor(red: 23/255, green: 28/255, blue: 63/255, alpha: 1).CGColor
        
        timerView.layer.shadowColor = color
        timerView.layer.shadowOpacity = 0.9
        timerView.layer.shadowRadius = 4
        timerView.layer.shadowOffset = CGSizeZero
        Timer.duration.animationDuration = 60
        
    }
    
    
    func UpdateTimeLabel(){
        
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
        timeLabel.textColor = UIColor.whiteColor()
    }
    
    @IBAction func payWithMobilePay(sender: AnyObject) {
        
        self.performSegueWithIdentifier("catchedFish", sender: nil)
        
        
    }
    
}









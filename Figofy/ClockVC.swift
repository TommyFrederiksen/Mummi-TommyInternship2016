//
//  ClockVC.swift
//  Figofy
//
//  Created by Tommy on 05/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class ClockVC: UIViewController {
    
    var payment = MobilePayPayment()
    var manager = MobilePayManager()
    let timer = Timer()
    let clock = Clock()
   
    
    
    
    var clockTimer: NSTimer?
    //var timeLeft = Timer.duration.animationDuration?.hashValue
    var countDown: NSTimer?
    var TESTSTR: String?
    
    @IBOutlet weak var CountDownClock: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerRingView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        countDown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Update"), userInfo: nil, repeats: true)
        UpdateTimerView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UpdateTimeLabel()
        UpdateTimerView()
        
    }
    
    deinit{
        clockTimer?.invalidate()
    }
    
    func Update()
    {
    }
    func UpdateTimerView()
    {
        let timerView = Timer(frame: CGRectMake(0,0,300,300))
        timerRingView.addSubview(timerView)
        timerView.layer.addSublayer(timerView.progressLayer)
        timerView.layer.addSublayer(timerView.progressLayer2)
        timerView.layer.addSublayer(timerView.progressLayer3)
      
        timerView.animateProgressView(60)
        
        
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









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
    
    @IBOutlet weak var aquariumView: UIImageView!
    var clockTimer: NSTimer?
    var countDown: NSTimer?
    var TESTSTR: String?
    
    @IBOutlet weak var CountDownClock: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        countDown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Update"), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        UpdateTimeLabel()
        UpdateTimerView()
        aquariumView.clipsToBounds = true
        aquariumView.layer.cornerRadius = 130
        
    }
    
    deinit{
        clockTimer?.invalidate()
    }
    
    func Update()
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
        timeLabel.textColor = UIColor.whiteColor()
    }
    func UpdateTimerView()
    {
        let timerView = Timer(frame: CGRectMake(0,0,0,0))
        view.addSubview(timerView)
        timerView.center = self.view.center
        timerView.layer.addSublayer(timerView.progressLayer)
        timerView.layer.addSublayer(timerView.progressLayer2)
        timerView.layer.addSublayer(timerView.progressLayer3)
        timerView.animateProgressView(60)
    }
    
    func UpdateTimeLabel()
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
        timeLabel.textColor = UIColor.blueColor()
    }
    
    
    
}









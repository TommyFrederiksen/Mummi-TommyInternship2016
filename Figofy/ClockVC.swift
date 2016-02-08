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
    
    @IBOutlet weak var timeLabel: UILabel!
    let clock = Clock()
    
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "UpdateTimeLabel", userInfo: nil, repeats: true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UpdateTimeLabel()
        
        
    }
    func UpdateTimeLabel(){
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    deinit{
        timer?.invalidate()
    }
    
    
    
}

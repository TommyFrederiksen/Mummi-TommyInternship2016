//
//  Timer.swift
//  Figofy
//
//  Created by Tommy on 12/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore


class Timer: UIView {

    struct duration {
        static var animationDuration:NSTimeInterval?
    }
     // The duration of the animation in seconds
    var circlePath: UIBezierPath = UIBezierPath()
    var circlePath2: UIBezierPath = UIBezierPath()
    let circleLayer2: CAShapeLayer = CAShapeLayer()
    let circleLayer: CAShapeLayer = CAShapeLayer()
    let anim = CABasicAnimation(keyPath: "strokeEnd")
    let anim2 = CABasicAnimation(keyPath: "strokeEnd")
    
    
    func ClockMaker()
    {
        circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2 ,y: frame.size.height/2), radius: (frame.size.width/2)-30, startAngle: CGFloat(-M_PI/2.0), endAngle: CGFloat(M_PI*(1.5)), clockwise: true)
        
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        let testColor = UIColor(red: 23/255, green: 93/255, blue: 235/255, alpha: 1)
        circleLayer.strokeColor = testColor.CGColor
        
        circleLayer.lineWidth = 12
        circleLayer.strokeEnd = 0.0
        layer.addSublayer(circleLayer)
        
    }
    func ClockUnderCircle(){
        circlePath2 = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2 ,y: frame.size.height/2), radius: (frame.size.width/2)-30, startAngle: CGFloat(-M_PI/2), endAngle: CGFloat(-2.5*M_PI), clockwise: false)
        circleLayer2.path = circlePath2.CGPath
        circleLayer2.strokeColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1).CGColor
        circleLayer2.lineWidth = 12
        circleLayer2.fillColor = UIColor.clearColor().CGColor
        circleLayer2.strokeEnd = 0.0
        layer.addSublayer(circleLayer2)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.ClockMaker()
        self.ClockUnderCircle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.ClockMaker()
        self.ClockUnderCircle()
        
        
    }
    
    
    func animate()
    {
        anim.duration = 0
        anim.fromValue = 0
        anim.toValue = 1
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        anim2.duration = duration.animationDuration!
        anim2.fromValue = 0
        anim2.toValue = 1
        anim2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        circleLayer2.addAnimation(anim2, forKey: "animateCircle2")
        circleLayer.addAnimation(anim, forKey: "animateCircle")
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd = 1
        circleLayer2.strokeStart = 0
        circleLayer2.strokeEnd = 1
    }
}
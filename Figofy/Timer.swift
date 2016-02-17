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

    let animationDuration:NSTimeInterval = 60.0 // The duration of the animation in seconds
    var circlePath: UIBezierPath = UIBezierPath()
    let circleLayer: CAShapeLayer = CAShapeLayer()
    let anim = CABasicAnimation(keyPath: "strokeEnd")
    
    
    func ClockMaker()
    {
        circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2 ,y: frame.size.height/2), radius: (frame.size.width/2)-30, startAngle: 0, endAngle: CGFloat(M_PI*(2.0)), clockwise: true)
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = UIColor.blackColor().CGColor
        circleLayer.lineWidth = 4
        circleLayer.strokeEnd = 0.0
        layer.addSublayer(circleLayer)
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.ClockMaker()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.ClockMaker()
        
        
    }
    
    
    func animate()
    {
        anim.duration = animationDuration
        anim.fromValue = 0
        anim.toValue = 1
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        circleLayer.addAnimation(anim, forKey: "animateCircle")
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd = 1
    }
}
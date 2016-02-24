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
    let circleLayer: CAShapeLayer = CAShapeLayer()
    let anim = CABasicAnimation(keyPath: "strokeEnd")
    
    
    func ClockMaker()
    {
        let startAngle = CGFloat(M_PI_2)
        let endAngle = CGFloat(M_PI * 2 + M_PI_2)
        let centerPoint = CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2)
        
        let radius = CGRectGetWidth(frame)/2-30.0
        
        circlePath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        let testColor = UIColor(red: 23/255, green: 93/255, blue: 235/255, alpha: 1)
        circleLayer.strokeColor = testColor.CGColor
        
        circleLayer.lineWidth = 12
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
        anim.duration = 20
        anim.fromValue = 0
        anim.toValue = 1
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        circleLayer.addAnimation(anim, forKey: "strokeEnd")
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd = 1
    }
}
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


//this call will create 3 circles and animate them as a countdown timer
class Timer: UIView {
    
    // MARK: Durations
    let numberOfTeethInSeconds:UInt = 10000 // inner circle
    let numberOfTeethInMinuts:UInt = 60 // mid circle
    let numberOfTeethInHurs:UInt = 12  // outer circle
    
    // MARK: Teeth stetings first number is with second is deabth
    let teethSizeSeconds = CGSizeMake(2, 6)
    let teethSizeMinuts = CGSizeMake(20, 4)
    let teethSizeHours = CGSizeMake(100, 2)
    
    // Mark: Durations is in seconds
    let animationDurationOfSeconds: NSTimeInterval = 60
    let animationDurationOfMinuts: NSTimeInterval = 60*60
    let animationDurationOfHours: NSTimeInterval = 60*60*12
    
    // MARK: Settind active and inactive colors
    let inactiveColor = UIColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 1)
    let activeColor = UIColor(red: 29.0/255.0, green: 175.0/255.0, blue: 255.0/255.0, alpha: 1)
    
    
    let shapeLayer = CAShapeLayer() // The teeth shape
    let drawLayer = CAShapeLayer() // The arc fill
    
    let anim = CABasicAnimation(keyPath: "strokeEnd") // The stroke animation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CommonSetup(numberOfTeethInSeconds, teethSize: teethSizeSeconds, animationDuration: animationDurationOfSeconds)
        //CommonSetup(numberOfTeethInMinuts, teethSize: teethSizeMinuts, animationDuration: animationDurationOfMinuts)
        //CommonSetup(numberOfTeethInHurs, teethSize: teethSizeHours, animationDuration: animationDurationOfHours)
        //animate(0, toValue: 1, animationDuration: animationDurationOfSeconds)
        //animate(0, toValue: 1, animationDuration: animationDurationOfMinuts)
        //animate(0, toValue: 1, animationDuration: animationDurationOfHours)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CommonSetup(numberOfTeethInSeconds, teethSize: teethSizeSeconds, animationDuration: animationDurationOfSeconds)
        //CommonSetup(numberOfTeethInMinuts, teethSize: teethSizeMinuts, animationDuration: animationDurationOfMinuts)
        //CommonSetup(numberOfTeethInHurs, teethSize: teethSizeHours, animationDuration: animationDurationOfHours)
        //animate(0, toValue: 1, animationDuration: animationDurationOfSeconds)
        //animate(0, toValue: 1, animationDuration: animationDurationOfMinuts)
        //animate(0, toValue: 1, animationDuration: animationDurationOfHours)
    }
    
    func getPathMask(size:CGSize, teethCount:UInt, teethSize:CGSize, radius:CGFloat) -> CGPathRef {
    
        let halfHeight = size.height*0.5
        let halfWidth = size.width*0.5
        let angle = CGFloat(2*M_PI/Double(teethCount))// the change in angle 
        
        // Create the template path of a single shape.
        let templatePath = CGPathCreateWithRect(CGRectMake(-teethSize.width*0.5, radius, teethSize.width, teethSize.height), nil)
        
        let returnPath = CGPathCreateMutable()
        
        for i in 0..<teethCount { // Copy, translate and rotate shapes around
            
            let translate = CGAffineTransformMakeTranslation(halfWidth, halfHeight);
            var rotate = CGAffineTransformRotate(translate, angle*CGFloat(i))
            CGPathAddPath(returnPath, &rotate, templatePath)
        }
        
        return CGPathCreateCopy(returnPath)!
    }
    
    
    func CommonSetup(numberOfTeeth: UInt, teethSize: CGSize, animationDuration: NSTimeInterval){
        self.backgroundColor = UIColor.blackColor()
        
        shapeLayer.path = getPathMask(frame.size, teethCount: numberOfTeeth, teethSize: teethSize, radius: ((frame.width*0.5)-teethSize.height))
        
        let halfWidth = frame.size.width*0.5
        let halfHeight = frame.size.height*0.5
        let angle = CGFloat(M_PI/Double(numberOfTeeth));
        
        drawLayer.path = UIBezierPath(arcCenter: CGPointMake(halfWidth, halfHeight), radius: halfWidth, startAngle: CGFloat(-M_PI_2)-angle, endAngle: CGFloat(M_PI*1.5)+angle, clockwise: true).CGPath
        drawLayer.frame = frame
        drawLayer.fillColor = inactiveColor.CGColor
        drawLayer.strokeColor = activeColor.CGColor
        
        drawLayer.strokeStart = 0
        drawLayer.strokeEnd = 0
        drawLayer.lineWidth = halfWidth
        drawLayer.mask = shapeLayer
        layer.addSublayer(drawLayer)
        
        // MARK: Setting up animation
        anim.duration = animationDuration
        anim.fromValue = drawLayer.strokeStart
        anim.toValue = 1.0
        anim.repeatCount = Float.infinity
    }
    
        func animate(fromValue: CGFloat, toValue: CGFloat, animationDuration: NSTimeInterval)
        {
            
            anim.fromValue = fromValue
            anim.toValue = toValue
            
            let value = NSTimeInterval(abs(toValue-fromValue))
            anim.duration = animationDuration*value
            drawLayer.addAnimation(anim, forKey: "circelAnim")
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            drawLayer.strokeEnd = toValue;
            CATransaction.commit()
            
        }
        
        
    
    
    

    
}

//
//  Timer.swift
//  Figofy
//
//  Created by Tommy on 12/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import SceneKit
import SpriteKit
import Foundation
import UIKit
import QuartzCore


class Timer: UIView {
    
    var layers = [CAShapeLayer]()
    let progressLayer = CAShapeLayer()
    let progressLayer2 = CAShapeLayer()
    let progressLayer3 = CAShapeLayer()
    
    let secondsGradientMask = CAGradientLayer()
    let minutesGradientMask = CAGradientLayer()
    let hoursGradientMask = CAGradientLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createProgressLayer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createProgressLayer()
    }
    
    
    func animateProgressView(timeLeft: Int) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(1.0)
        animation.toValue = CGFloat(0.0)
        animation.duration = Double(timeLeft*60*60)
        animation.additive = true
        animation.fillMode = kCAFillModeForwards
        animation.fadeOutDuration = CGFloat(5)
        animation.fadeInDuration = CGFloat(5)
        animation.repeatCount = 60
        animation.removedOnCompletion = false
        progressLayer.addAnimation(animation, forKey: "strokeEnd")
        let animation2 = CABasicAnimation(keyPath: "strokeEnd")
        animation2.fromValue = CGFloat(1.0)
        animation2.toValue = CGFloat(0.0)
        animation2.duration = Double(timeLeft*60)
        animation2.additive = true
        animation2.fillMode = kCAFillModeForwards
        animation2.fadeOutDuration = CGFloat(5)
        animation2.fadeInDuration = CGFloat(5)
        animation2.repeatCount = 60
        animation2.removedOnCompletion = false
        progressLayer2.addAnimation(animation2, forKey: "strokeEnd")
        let animation3 = CABasicAnimation(keyPath: "strokeEnd")
        animation3.fromValue = CGFloat(1.0)
        animation3.toValue = CGFloat(0.0)
        animation3.duration = Double(timeLeft)
        animation3.additive = true
        animation3.fillMode = kCAFillModeForwards
        animation3.fadeOutDuration = CGFloat(5)
        animation3.fadeInDuration = CGFloat(5)
        animation3.repeatCount = 60
        animation3.removedOnCompletion = false
        progressLayer3.addAnimation(animation3, forKey: "strokeEnd")
    }
    
    
    private func createProgressLayer() {
        
        let halfWidth = frame.size.width/2
        let halfHeight = frame.size.height/2
        let startAngle = CGFloat(M_PI_2)
        let endAngle = CGFloat(M_PI * 2 + M_PI_2)
        let centerPoint = CGPointMake(halfWidth/2, halfHeight/2)
        let radius = halfWidth - 10
        let dashLength = (halfWidth*2 - 30)*CGFloat(M_PI)
        
        progressLayer.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        
        
        progressLayer.backgroundColor = UIColor.clearColor().CGColor
        progressLayer.shadowColor = UIColor.whiteColor().CGColor
        progressLayer.shadowRadius = 3.5
        progressLayer.shadowOpacity = 1
        progressLayer.shadowOffset = CGSizeZero
        progressLayer.allowsEdgeAntialiasing = true
        progressLayer.masksToBounds = false
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.blueColor().CGColor
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = 0.0
        progressLayer.lineWidth = 10
        progressLayer.lineDashPhase = 0
        progressLayer.lineDashPattern = [dashLength*1]
        progressLayer.lineJoin = kCALineJoinRound
        
        progressLayer2.path = UIBezierPath(arcCenter: centerPoint, radius: radius-10, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        
        
        progressLayer2.backgroundColor = UIColor.clearColor().CGColor
        progressLayer2.shadowColor = UIColor.whiteColor().CGColor
        progressLayer2.shadowRadius = 2.5
        progressLayer2.shadowOpacity = 1
        progressLayer2.shadowOffset = CGSizeZero
        progressLayer2.allowsEdgeAntialiasing = true
        progressLayer2.masksToBounds = false
        progressLayer2.fillColor = nil
        progressLayer2.strokeColor = UIColor.blueColor().CGColor
        progressLayer2.strokeStart = 0.0
        progressLayer2.strokeEnd = 0.0
        progressLayer2.lineWidth = 5
        //progressLayer2.lineDashPattern = [dashLength,0.1]
        progressLayer2.lineJoin = kCALineJoinRound
        
        progressLayer3.path = UIBezierPath(arcCenter: centerPoint, radius: radius-20, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        
        
        progressLayer3.backgroundColor = UIColor.clearColor().CGColor
        progressLayer3.shadowColor = UIColor.whiteColor().CGColor
        progressLayer3.shadowRadius = 1.5
        progressLayer3.shadowOpacity = 1
        progressLayer3.shadowOffset = CGSizeZero
        progressLayer3.allowsEdgeAntialiasing = true
        progressLayer3.masksToBounds = false
        progressLayer3.fillColor = nil
        progressLayer3.strokeColor = UIColor.blueColor().CGColor
        progressLayer3.strokeStart = 0.0
        progressLayer3.strokeEnd = 0.0
        progressLayer3.lineWidth = 1.5
        progressLayer3.lineJoin = kCALineJoinRound
        
       
        

    
}

func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 60))
}


}




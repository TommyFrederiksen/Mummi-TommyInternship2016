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
        
        let halfWidth = self.bounds.size.width/2
        let halfHeight = self.bounds.size.height/2
        let startAngle = CGFloat(-M_PI_2)
        let endAngle = CGFloat(M_PI * 2 - M_PI_2)
        let centerPoint = CGPointMake(halfWidth/2, halfHeight/2)
        //let radius = halfWidth - 10
        let dashLength = (150)*CGFloat(M_PI)
        
        progressLayer.path = UIBezierPath(arcCenter: centerPoint, radius: 150, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        SetLayer(progressLayer,line: 10.0)
        progressLayer.lineDashPattern = [dashLength/100,3]
        
        
        progressLayer2.path = UIBezierPath(arcCenter: centerPoint, radius: 140, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        SetLayer(progressLayer2,line: 5.0)
        
        
        
        progressLayer3.path = UIBezierPath(arcCenter: centerPoint, radius: 130, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        SetLayer(progressLayer3, line: 1.5)
        
        
        
}
    func SetLayer(progresslayer: CAShapeLayer, line: Double) ->CAShapeLayer{
        progresslayer.backgroundColor = UIColor.clearColor().CGColor
        progresslayer.shadowColor = UIColor.whiteColor().CGColor
        progresslayer.shadowRadius = 2.5
        progresslayer.shadowOpacity = 1
        progresslayer.shadowOffset = CGSizeZero
        progresslayer.allowsEdgeAntialiasing = true
        progresslayer.masksToBounds = false
        progresslayer.fillColor = nil
        progresslayer.strokeColor = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 1).CGColor
        progresslayer.strokeStart = 0.0
        progresslayer.strokeEnd = 0.0
        progresslayer.lineJoin = kCALineJoinRound
        progresslayer.lineWidth = CGFloat(line)
        return progresslayer
    }

func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 60))
}


}




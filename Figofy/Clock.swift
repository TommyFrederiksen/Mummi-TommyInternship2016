//
//  Clock.swift
//  Figofy
//
//  Created by Tommy on 05/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics
import CoreText






class Clock
{
    
    func time ()->(h:Int,m:Int,s:Int)
    {
        
        
        let dateFormatter = NSDateFormatter()
        let formatStrings = ["hh","mm","ss"]
        var hms = [Int]()
        
        
        for f in formatStrings
        {
            
            dateFormatter.dateFormat = f
            let date = NSDate()
            if let formattedDateString = Int(dateFormatter.stringFromDate(date))
            {
                hms.append(formattedDateString)
            }
            
        }
        
        return (h:hms[0],m:hms[1],s:hms[2])
    }
    
    func timeCords(x:CGFloat,y:CGFloat,time: (h:Int,m:Int,s:Int),radius:CGFloat,adjustment:CGFloat=90)->(h:CGPoint,m:CGPoint,s:CGPoint)
    {
        let circleX = x
        let circleY = y
        var circleRadius = radius
        var points = [CGPoint]()
        var angle = degree2radian(6)
        func newPoint (t:Int)
        {
            let xPoint = circleX - radius * cos(angle * CGFloat(t) + degree2radian(adjustment))
            let yPoint = circleY - radius * sin(angle * CGFloat(t) + degree2radian(adjustment))
            points.append(CGPoint(x: xPoint, y: yPoint))
            
        }
        var hours = time.h
        if hours > 12
        {
            hours = hours - 12
        }
        let hoursInSeconds = time.h * 3600 + time.m * 60 + time.s
        newPoint(hoursInSeconds * 5/3600)
        
        circleRadius = radius * 1.25
        let minutesInSeconds = time.m * 60 + time.s
        newPoint(minutesInSeconds/60)
        
        circleRadius = radius * 1.5
        newPoint(time.s)
        return (h:points[0],m:points[1],s:points[2])
        
    }
    func degree2radian(a:CGFloat)->CGFloat
    {
        let radian = CGFloat(M_PI) * a/180
        return radian
        
    }
}


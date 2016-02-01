//
//  ButtonDesign.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 28/01/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation
import UIKit

class ButtonDesign: UIButton {
    
    //let figofyColor = UIColor(red: 51/255, green: 51/255, blue: 153/255, alpha: 1)
    
    @IBInspectable var borderColor: UIColor = UIColor.blueColor()
    @IBInspectable var buttonColor: UIColor = UIColor.blueColor()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context);
        CGContextAddRect(context, CGContextGetClipBoundingBox(context));
        CGContextAddArc(context, 19, 19, 19, 0, CGFloat(Float(M_PI) * 2), 0)
        CGContextClosePath(context);
        CGContextEOClip(context);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 168, 0);
        CGContextAddLineToPoint(context, 168, 38);
        CGContextAddLineToPoint(context, 0, 38);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextSetRGBFillColor(context, 0.75, 0.75, 0.75, 0.5);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
        
    }
    
    
    
    
    
    
}
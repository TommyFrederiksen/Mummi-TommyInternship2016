//
//  NSDateExtensions.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 11/03/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation

extension NSDate {
    
    class func convertFirebaseTimestampToDate(stamp timestamp: NSTimeInterval) -> NSDate {
        return NSDate(timeIntervalSince1970: timestamp/1000)
    }
    
    class func convertToString(time dateTime: NSDate, style: NSDateFormatterStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = style
        return formatter.stringFromDate(dateTime)
    }
    
}
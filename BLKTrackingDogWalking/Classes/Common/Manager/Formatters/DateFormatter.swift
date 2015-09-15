//
//  DateFormatter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 15/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class DateFormatter: NSObject, Formatter {
    
    private let formatter = NSDateFormatter()
    
    init(formatString:String) {
        formatter.dateFormat = formatString
        super.init()
    }
    
    func format(object:Any?) -> String? {
        if let date = object as? NSDate {
            return formatter.stringFromDate(date)
        }
        
        return nil
    }

}

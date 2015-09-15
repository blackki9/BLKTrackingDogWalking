//
//  TimeFormatter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 15/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TimeFormatter: NSObject,Formatter {
    func format(object:Any?) -> String? {
        
        if let timeValue = object as? Int {
            let seconds = timeValue % 60
            let minutes = (timeValue / 60) % 60
            let hours = timeValue / 3600
            
            return "\(hours):\(minutes):\(seconds)"
        }
        
        return nil
    }
}

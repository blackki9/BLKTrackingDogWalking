//
//  WalkingTrack.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class WalkingTrack {
    var date: NSDate?
    var distanceInMeters: Int?
    var timeInSeconds: Int?
    var locations = [Location]()
    
    init(distance:Int,time:Int,date:NSDate) {
        self.distanceInMeters = distance
        self.timeInSeconds = time
        self.date = date
    }
    
}

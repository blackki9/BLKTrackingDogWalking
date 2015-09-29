//
//  WalkingTrack.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class WalkingTrack : Hashable, Equatable {
    var date: NSDate?
    var distanceInMeters: Int?
    var timeInSeconds: Int?
    var locations = [Location]()
    var hashValue:Int = 0
    
    init(distance:Int,time:Int,date:NSDate) {
        self.distanceInMeters = distance
        self.timeInSeconds = time
        self.date = date
        hashValue = Int(date.timeIntervalSince1970)
    }

}

func == (lhs: WalkingTrack, rhs: WalkingTrack) -> Bool {
    if let leftDate = lhs.date,let rightDate = rhs.date {
        return leftDate.isEqualToDate(rightDate)
    }
    
    return false
}

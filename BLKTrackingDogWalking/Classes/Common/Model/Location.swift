//
//  Location.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class Location: NSObject {
    let longitude:Double
    let latitude:Double
    let track:WalkingTrack? = nil
    let timestamp:NSDate?

    
    init(longitude:Double,latitude:Double,timestamp:NSDate) {
        self.longitude = longitude
        self.latitude = latitude
        self.timestamp = timestamp
        super.init()
    }
}

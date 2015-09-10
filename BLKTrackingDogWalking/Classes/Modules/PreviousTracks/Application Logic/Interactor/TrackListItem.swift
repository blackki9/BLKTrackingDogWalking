//
//  TrackListItem.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

struct TrackListItem {
    let distancePassed:String
    let timeElapsed:String
    let dateOfWalking:String
    
    init(distance:String,time:String,date:String) {
        self.distancePassed = distance
        self.timeElapsed = time
        self.dateOfWalking = date
    }
}

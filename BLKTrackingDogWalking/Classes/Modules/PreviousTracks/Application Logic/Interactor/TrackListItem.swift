//
//  TrackListItem.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

struct TrackListItem : Hashable, Equatable {
    let distancePassed:String
    let timeElapsed:String
    let dateOfWalking:String
    var locations = [LocationShowItem]()
    var hashValue : Int {
        get {
           
            
            return dateOfWalking.hashValue
        }
    }
    
    init(distance:String,time:String,date:String,locations:[LocationShowItem]?) {
        self.distancePassed = distance
        self.timeElapsed = time
        self.dateOfWalking = date
        if let newLocations = locations {
            self.locations = newLocations
        }
    }
}

func ==(lhs: TrackListItem, rhs: TrackListItem) -> Bool {
    return lhs.distancePassed == rhs.distancePassed && lhs.dateOfWalking == rhs.dateOfWalking && lhs.timeElapsed == rhs.timeElapsed
}

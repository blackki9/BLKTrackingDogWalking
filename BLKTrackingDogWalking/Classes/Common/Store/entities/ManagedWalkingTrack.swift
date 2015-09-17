//
//  ManagedWalkingTrack.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 17/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation
import CoreData

class ManagedWalkingTrack: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var distance: NSNumber
    @NSManaged var time: NSNumber
    @NSManaged var locations: NSOrderedSet

}

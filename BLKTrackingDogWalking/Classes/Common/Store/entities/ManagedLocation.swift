//
//  ManagedLocation.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation
import CoreData

class ManagedLocation: NSManagedObject {

    @NSManaged var longitude: NSNumber
    @NSManaged var latitude: NSNumber
    @NSManaged var timestamp: NSDate
    @NSManaged var track: ManagedWalkingTrack

}

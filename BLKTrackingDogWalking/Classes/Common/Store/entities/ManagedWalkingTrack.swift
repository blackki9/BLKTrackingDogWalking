//
//  ManagedWalkingTrack.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation
import CoreData

class ManagedWalkingTrack: NSManagedObject {

    @NSManaged var date: NSTimeInterval
    @NSManaged var distance: Int32
    @NSManaged var time: Int32

}

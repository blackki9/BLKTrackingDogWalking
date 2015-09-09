//
//  CoreDataStore.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class CoreDataStore {
    init() {
        MagicalRecord.setupCoreDataStack()
    }
    
    func fetchTracksWithPredicate(predicate:NSPredicate) -> [ManagedWalkingTrack] {
        return ManagedWalkingTrack.MR_findAllSortedBy("date", ascending: true, withPredicate: predicate) as! [ManagedWalkingTrack]
    }
    
    func newWalkingTrack() -> ManagedWalkingTrack {
        return ManagedWalkingTrack.MR_createEntity()
    }
    
    func save() {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            context.save(nil)
        }
    }
    
}

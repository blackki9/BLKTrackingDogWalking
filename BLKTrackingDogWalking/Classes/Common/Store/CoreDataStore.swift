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
    
    func fetchTracksWithPredicate(predicate:NSPredicate?,completion:(([ManagedWalkingTrack])->())?) {
        let privateContext = NSManagedObjectContext.MR_context()
        
        // When using private contexts you must execute the core data code in it's private queue using performBlock: or performBlockAndWait:
        privateContext.performBlock { () -> Void in
            let privateObjects:Array<NSManagedObject> = ManagedWalkingTrack.MR_findAllWithPredicate(predicate, inContext: privateContext) as! Array<NSManagedObject>

            let privateObjectsIDs = privateObjects.map({ (object:NSManagedObject) -> NSManagedObjectID in
                return object.objectID
            })
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let mainPredicate = NSPredicate(format: "self IN %@", privateObjectsIDs)
                let finalResults = ManagedWalkingTrack.MR_findAllSortedBy("date", ascending: true, withPredicate: mainPredicate) as! [ManagedWalkingTrack]
                if let completionBlock = completion {
                    completionBlock(finalResults)
                }
            })
        }
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

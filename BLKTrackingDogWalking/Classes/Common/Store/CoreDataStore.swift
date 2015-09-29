//
//  CoreDataStore.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class CoreDataStore {
    
    let privateContext:NSManagedObjectContext
    
    init() {
        MagicalRecord.setupCoreDataStack()
        privateContext = NSManagedObjectContext.MR_context()
    }
    
    func fetchTracksWithPredicate(predicate:NSPredicate?,completion:(([ManagedWalkingTrack])->())?) {
        privateContext.performBlock { () -> Void in
            let privateObjects:Array<NSManagedObject> = ManagedWalkingTrack.MR_findAllWithPredicate(predicate, inContext: self.privateContext) as! Array<NSManagedObject>

            let privateObjectsIDs = privateObjects.map({ (object:NSManagedObject) -> NSManagedObjectID in
                return object.objectID
            })
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let mainPredicate = NSPredicate(format: "self IN %@", privateObjectsIDs)
                let finalResults = ManagedWalkingTrack.MR_findAllSortedBy("date", ascending: false, withPredicate: mainPredicate) as! [ManagedWalkingTrack]
                if let completionBlock = completion {
                    completionBlock(finalResults)
                }
            })
        }
    }
    
    func update(block:(context:NSManagedObjectContext!)->()) {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            block(context: context)
            context.MR_saveToPersistentStoreAndWait()
        }
    }
    
    func deleteItemByDate(date:NSDate) {
        MagicalRecord.saveWithBlock { (context) -> Void in
            ManagedWalkingTrack.MR_deleteAllMatchingPredicate(NSPredicate(format: "date = %@", date), inContext: context)
            context.MR_saveToPersistentStoreAndWait()
        }
    }
    
}

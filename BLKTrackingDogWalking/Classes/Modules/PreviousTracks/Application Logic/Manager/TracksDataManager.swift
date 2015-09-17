//
//  TracksDataManager.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TracksDataManager: NSObject {
    var dataStore:CoreDataStore?
    
    init(coreDataStore:CoreDataStore) {
        dataStore = coreDataStore
    }
    
    func findAllTracksSorted(completion:(([WalkingTrack])->())?) {
        if let dataStore = self.dataStore {
            dataStore.fetchTracksWithPredicate(nil, completion: { (tracks:[ManagedWalkingTrack]) -> () in
                if let completion = completion {
                    let convertedArray = tracks.map({(managedTrack:ManagedWalkingTrack) -> WalkingTrack in
                        let intValue = managedTrack.time.integerValue
                        return WalkingTrack(distance: managedTrack.distance.integerValue, time:managedTrack.time.integerValue, date: managedTrack.date)
                    })
                    completion(convertedArray)
                }
            })
        }
    }
}

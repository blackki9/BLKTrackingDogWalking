//
//  NewTrackDataManager.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import CoreLocation

class NewTrackDataManager: NSObject {
    let dataStore:CoreDataStore
    var tracksManager:TracksManagerInterface? = nil
    var currentDistance:Int = 0
    var currentTime:Int = 0
    var locations = [Location]()
    
    init(dataStore:CoreDataStore) {
        self.dataStore = dataStore
        
        super.init()
    }

    func startNewTrackWithProgress(progress:((seconds:Int,distance:Int,location:Location?) -> ())?) {
        tracksManager?.startTracking({ (seconds, distance, location) -> () in
            if let progressBlock = progress {
                var newLocation:Location? = nil
                self.currentDistance = distance
                self.currentTime = seconds
                if let location = location {
                    newLocation = Location(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude, timestamp: NSDate())

                    self.locations.append(newLocation!)
                }
                progressBlock(seconds:seconds,distance:distance,location:newLocation)
            }
    })
}
    func stopNewTrack() {
        currentDistance = 0
        currentTime = 0
        if let stopped = tracksManager?.isStopped() {
            if !stopped {
                saveData()
                tracksManager?.stopTracking()
            }
        }
    }
    
    func saveData() {
        dataStore.update { (context) -> () in
            let managedTrack = ManagedWalkingTrack.MR_createEntityInContext(context)
            managedTrack.date = NSDate()
            
            managedTrack.distance = NSNumber(integer:self.currentDistance)
            managedTrack.time = NSNumber(integer:self.currentTime)
            
            managedTrack.addLocations(self.locations,context:context)
        }
    }
    
}

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

    
    func addLocations(locations:[Location], context:NSManagedObjectContext!) {
        let managedLocations = locations.map({(location:Location) -> ManagedLocation in
            let managedLocation = ManagedLocation.MR_createEntityInContext(context)
            managedLocation.latitude = NSNumber(double: location.latitude)
            managedLocation.longitude = NSNumber(double:location.longitude)
            managedLocation.timestamp = location.timestamp!
            
            return managedLocation
        })
       addManagedLocations(managedLocations)
    }
    
    private func addManagedLocations(managedLocations:[ManagedLocation]) {
        
        var mutableLocations = self.locations.mutableCopy() as! NSMutableOrderedSet
        mutableLocations.addObjectsFromArray(managedLocations)
        self.locations = mutableLocations.copy() as! NSOrderedSet
    }
}

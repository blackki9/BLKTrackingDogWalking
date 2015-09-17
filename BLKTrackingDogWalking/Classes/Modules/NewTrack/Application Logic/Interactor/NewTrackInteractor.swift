//
//  NewTrackInteractor.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class NewTrackInteractor: NSObject, NewTrackInteractorInput {
    var output:NewTrackInteractorOutput?
    var dataManager:NewTrackDataManager?
    
    func startTracking() {
        output?.showDate(NSDate())
        dataManager?.startNewTrackWithProgress({ (seconds, distance, location) -> () in
            self.output?.showTime(seconds)
            self.output?.showDistance(Double(distance))
            if let location = location {
                self.output?.showNewLocation(location.longitude, latitude: location.latitude)
            }
          
               println("seconds : \(seconds) + meters : \(distance)")
        })
    }
    
    func stopTracking() {
        dataManager?.stopNewTrack()
    }
    
}

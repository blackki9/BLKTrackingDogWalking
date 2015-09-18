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
    var successChecker:SuccessCheckManagerInterface?
    
    func startTracking() {
        output?.showDate(NSDate())
        dataManager?.startNewTrackWithProgress({ (seconds, distance, location) -> () in
            self.output?.showTime(seconds)
            self.output?.showDistance(Double(distance))
            if let location = location {
                self.output?.showNewLocation(location.longitude, latitude: location.latitude)
            }
        })
    }
    
    func stopTracking() {
        
        if let successChecker = successChecker,let dataManager = dataManager {
            if successChecker.isTrackSucceededWithDistance(dataManager.currentDistance, time: dataManager.currentTime) {
                output?.trackSucceeded(true, reason: "Congratulations! You reached your goal")
            }
            else {
                output?.trackSucceeded(false, reason: "You didn't reach your day goal!")
            }
        }
        
        dataManager?.stopNewTrack()
        self.output?.showTime(dataManager!.currentTime)
        self.output?.showDistance(Double(dataManager!.currentDistance))
    }
    
}

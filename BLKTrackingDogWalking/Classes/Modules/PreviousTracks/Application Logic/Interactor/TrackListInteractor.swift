//
//  TrackListInteractor.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackListInteractor: NSObject,TrackListInteractorInput {
    var dataManager:TracksDataManager
    var output:TrackListInteractorOutput?
    let dateFormatter = NSDateFormatter()
    
    init(dataManager:TracksDataManager) {
        self.dataManager = dataManager
        
        super.init()
    }
    
    func findAllTracks() {
        dataManager.findAllTracksSorted {[weak self] (tracks:[WalkingTrack]) -> () in
            let convertedItems = tracks.map({(object:WalkingTrack) -> TrackListItem in
                let distanceString = object.distanceInMeters?.description
                let timeString = object.timeInMinutes?.description
                let dateString = self?.dateFormatter.stringFromDate(object.date!)
                
                return TrackListItem(distance:distanceString!, time: timeString!, date: dateString!)
            })
            
            self?.output?.tracksFound(convertedItems)
        }
    }
    
}

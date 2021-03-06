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
    var dateFormatter:Formatter?
    var timeFormatter:Formatter?
    var distanceFormatter:Formatter?
    
    init(dataManager:TracksDataManager) {
        self.dataManager = dataManager
        
        super.init()
    }
    
    func findAllTracks() {
        dataManager.findAllTracksSorted {[weak self] (tracks:[WalkingTrack]) -> () in
            let convertedItems = tracks.map({(object:WalkingTrack) -> TrackListItem in
                let distanceString = self?.distanceFormatter?.format(Double(object.distanceInMeters!))
                let timeString = self?.timeFormatter?.format(object.timeInSeconds!)
                let dateString = self?.dateFormatter?.format(object.date!)
                
                let result = TrackListItem(distance:distanceString!, time: timeString!, date: dateString!,locations: object.locations.map({ (location:Location) -> LocationShowItem in
                    let result = LocationShowItem(latitude:location.latitude,longitude:location.longitude)
                    
                    return result
                }))
                
                return result
            })
            
            self?.output?.tracksFound(convertedItems)
        }
    }
    
}

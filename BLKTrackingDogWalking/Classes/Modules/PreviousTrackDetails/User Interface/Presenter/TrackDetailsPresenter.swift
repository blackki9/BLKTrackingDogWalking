//
//  TrackDetailsPresenter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import MapKit

class TrackDetailsPresenter: NSObject {
    var viewInterface:TrackDetailsViewInterface?
    var interactorIntput:TrackDetailsInteractorInput?
}

extension TrackDetailsPresenter : TrackDetailsModuleInterface {
    func updateView() {
        interactorIntput?.updateView()
    }
}

extension TrackDetailsPresenter : TrackDetailsInteractorOutput {
    func fillInfo(details: TrackListItem) {
        viewInterface?.showDate(details.dateOfWalking)
        viewInterface?.showDistance(details.distancePassed)
        viewInterface?.showTime(details.timeElapsed)
        if let region = regionForDetails(details) {
            viewInterface?.showRegion(region)
        }
        
        if let path = pathForDetails(details) {
            viewInterface?.showPath(path)
        }
    }
    
    func regionForDetails(details:TrackListItem) -> MKCoordinateRegion? {
         let locations = details.locations
            if locations.count > 0 {
                let initialLoc = locations.first!
                var minLatitude = initialLoc.latitude
                var minLongitude = initialLoc.longitude
                var maxLat = minLatitude
                var maxLong = minLongitude
                
                for location in locations {
                    minLatitude = min(minLatitude,location.latitude)
                    minLongitude = min(minLongitude,location.longitude)
                    maxLat = max(maxLat,location.latitude)
                    maxLong = max(maxLong,location.longitude)
                }
                
                return MKCoordinateRegion(center: CLLocationCoordinate2DMake((minLatitude + maxLat) / 2, (minLongitude + maxLong)/2), span: MKCoordinateSpanMake((maxLat - minLatitude)*1.1, (maxLong - minLongitude) * 1.1))
            }
        
        return nil
    }
    
    func pathForDetails(details:TrackListItem) -> MKPolyline? {
         let locations = details.locations
            if locations.count > 0 {
                var coords = [CLLocationCoordinate2D]()
                
                for location in locations {
                    let coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
                    coords.append(coordinate)
                }
                
                return MKPolyline(coordinates: &coords, count: coords.count)
            }
        
        
        return nil
    }
}
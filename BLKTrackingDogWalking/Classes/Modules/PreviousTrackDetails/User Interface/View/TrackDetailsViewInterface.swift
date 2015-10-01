//
//  TrackDetailsViewInterface.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation
import MapKit

protocol TrackDetailsViewInterface {
    func showDate(dateString:String)
    func showTime(timeString:String)
    func showDistance(distanceString:String)
    func showRegion(region:MKCoordinateRegion)
    func showPath(path:MKPolyline)
    func showEndAndStartFlags(annotations:[MKAnnotation])
}
//
//  TracksManagerInterface.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation
import CoreLocation

protocol TracksManagerInterface {
    func startTracking(_: ((seconds:Int,distance:Int,location:CLLocation?) -> ())?)
    func stopTracking()
    func isStopped() -> Bool
}
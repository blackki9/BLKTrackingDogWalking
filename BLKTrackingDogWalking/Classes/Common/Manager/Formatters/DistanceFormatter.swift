//
//  DistanceFormatter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 15/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DistanceFormatter: NSObject, Formatter {
    let formatter = MKDistanceFormatter()
    func format(object:Any?) -> String? {
        
        if let distanceValue = object as? Double {
            let distance:CLLocationDistance = distanceValue
            return formatter.stringFromDistance(distance)
        }
        
        return nil
    }
}

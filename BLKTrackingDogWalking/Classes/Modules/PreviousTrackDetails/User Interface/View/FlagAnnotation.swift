//
//  FlagAnnotation.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 01/10/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit
import MapKit

class FlagAnnotation: NSObject, MKAnnotation {
    var coordinate:CLLocationCoordinate2D
    var title:String?
    
    static let image = UIImage(named: "flag")
    static let annotationViewId = "flagAnnotationId"
    init(coordinate:CLLocationCoordinate2D,title:String) {
        self.coordinate = coordinate
        self.title = title
    }
}

//
//  TrackListPresenter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackListPresenter: NSObject,TrackListModuleInterface {
 
    var trackListWireframe:TrackListWireFrame?
    
    func showSettings() {
        trackListWireframe?.showSettings()
    }
    
    func addTrack() {
        
    }
    
    func showTrackDetails() {
        
    }
    
}

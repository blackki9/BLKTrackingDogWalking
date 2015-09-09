//
//  SettingsInteractor.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class SettingsInteractor: NSObject {
    var settingsManager:SettingsManager?
    var output:SettingsInteractorOutput?
    
    func handleDistanceChange(distance:String) {
        output?.showError("wrong distance")
    }
    
    func handleTimeChange(time:String) {
        output?.showError("wrong time")
    }
    
    func fillInfo() {
        let distance = settingsManager?.distance.description
        let time = settingsManager?.time.description
        
        output?.showDistance(distance!)
        output?.showTime(time!)
    }
}

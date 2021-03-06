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
        //TODO:- add validator to distance
        if let distanceNumber = Int(distance) {
            settingsManager?.distance = distanceNumber
            settingsManager?.saveSettings()
        }
        else {
            output?.showError("wrong distance")
        }
    }
    
    func handleTimeChange(time:String) {
        //TODO:- add validator to time
        if let timeNumber = Int(time) {
            settingsManager?.time = timeNumber
            settingsManager?.saveSettings()
        }
        else {
            output?.showError("wrong time")
        }
    }
    
    func fillInfo() {
        let distance = settingsManager?.distance.description
        let time = settingsManager?.time.description
        
        output?.showDistance(distance!)
        output?.showTime(time!)
    }
}

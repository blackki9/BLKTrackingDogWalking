//
//  SuccessCheckManager.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 17/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class SuccessCheckManager: NSObject, SuccessCheckManagerInterface {
    var settingsManager:SettingsManager?
    
    func isTrackSucceededWithDistance(distance:Int,time:Int) -> Bool {
        if let settingsManager = self.settingsManager {
            if settingsManager.distance <= distance && settingsManager.time <= time {
                return true
            }
        }
        return false
    }
}

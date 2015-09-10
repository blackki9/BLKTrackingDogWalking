//
//  SettingsManager.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

let SettingsManagerDistanceKey = "SettingsManagerDistanceKey"
let SettingsManagerTimeKey = "SettingsManagerTimeKey"

let distanceDefaultValue = 1000
let timeDefaultValue = 15

class SettingsManager {
   
    var distance:Int = 0
    var time:Int = 0
    let userDefaults:NSUserDefaults
    
    init(userDefaults:NSUserDefaults) {
        self.userDefaults = userDefaults
        loadSettings()
    }
    
    func loadSettings() {
        distance = userDefaults.integerForKey( SettingsManagerDistanceKey)
        distance = (distance == 0) ? distanceDefaultValue : distance
        time = userDefaults.integerForKey(SettingsManagerTimeKey)
        time = (time == 0) ? timeDefaultValue : time
    }
    
    func saveSettings() {
        userDefaults.setInteger(distance, forKey: SettingsManagerDistanceKey)
        userDefaults.setInteger(time, forKey: SettingsManagerTimeKey)
        
        userDefaults.synchronize()
    }
}

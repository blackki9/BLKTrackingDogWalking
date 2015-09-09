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

class SettingsManager {
   
    var distance:Int = 0
    var time:Int = 0
    
    init() {
        loadSettings()
    }
    
    func loadSettings() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        distance = userDefaults.integerForKey( SettingsManagerDistanceKey)
        time = userDefaults.integerForKey(SettingsManagerTimeKey)
    }
    
    func saveSettings() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setInteger(distance, forKey: SettingsManagerDistanceKey)
        userDefaults.setInteger(time, forKey: SettingsManagerTimeKey)
        
        userDefaults.synchronize()
    }
}

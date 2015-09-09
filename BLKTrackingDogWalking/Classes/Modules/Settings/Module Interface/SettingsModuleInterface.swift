//
//  SettingsModuleInterface.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol SettingsModuleInterface {
    func handleDistanceChange(distance:String)
    func handleTimeChange(time:String)
    func fillInfo()
}

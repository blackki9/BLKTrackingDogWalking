//
//  SettingsModuleInterface.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol SettingsModuleInterface {
    func handleDistanceChange(row:Int)
    func handleTimeChange(time:Int)
    func fillInfo()
    func distanceCount() -> Int
    func distanceValueForRow(row:Int) -> String
}

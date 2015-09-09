//
//  SettingsViewInterface.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol SettingsViewInterface {
    
    func showDistance(distance:String)
    func showTime(time:String)
    func showError(reason:String)
    
}
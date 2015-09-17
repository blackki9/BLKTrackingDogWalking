//
//  SettingsViewInterface.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation


protocol NewTrackViewInterface {
    func showTime(time:String)
    func showDistance(distance:String)
    func showDate(date:String)
    func showNewLocation(location:LocationShowItem)
}
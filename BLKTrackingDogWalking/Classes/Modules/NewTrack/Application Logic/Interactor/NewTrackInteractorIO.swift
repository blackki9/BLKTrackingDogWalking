//
//  NewTrackInteractorIO.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol NewTrackInteractorInput {
    func startTracking()
}

protocol NewTrackInteractorOutput {
    func showTime(time:Int)
    func showDistance(distance:Double)
    func showDate(date:NSDate)
    
}
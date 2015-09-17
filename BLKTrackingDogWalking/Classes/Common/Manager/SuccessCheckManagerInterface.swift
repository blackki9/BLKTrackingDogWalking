//
//  SuccessCheckManagerInterface.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 17/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation


protocol SuccessCheckManagerInterface {
    
    func isTrackSucceededWithDistance(distance:Int,time:Int) -> Bool
    
}
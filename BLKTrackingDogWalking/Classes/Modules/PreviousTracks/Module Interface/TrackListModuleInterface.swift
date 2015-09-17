//
//  TrackListModuleInterface.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol TrackListModuleInterface {
    func showSettings()
    func addTrack()
    func showTrackDetailsWithIndex(details:TrackListItem) 
    func updateData()
}
//
//  TrackListInteractorOutput.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol TrackListInteractorOutput {
    func tracksFound(_: [TrackListItem])
}

protocol TrackListInteractorInput {
    func findAllTracks()
}
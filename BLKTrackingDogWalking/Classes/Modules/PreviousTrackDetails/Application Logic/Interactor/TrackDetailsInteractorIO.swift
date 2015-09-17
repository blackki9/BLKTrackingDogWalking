//
//  TrackDetailsInteractorIO.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

protocol TrackDetailsInteractorInput {
    func updateView()
}

protocol TrackDetailsInteractorOutput {
    func fillInfo(details:TrackListItem)
}



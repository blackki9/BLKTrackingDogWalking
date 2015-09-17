//
//  TrackDetailsInteractor.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackDetailsInteractor: NSObject {
    var output:TrackDetailsInteractorOutput?
    var trackDetails:TrackListItem?
}

extension TrackDetailsInteractor : TrackDetailsInteractorInput {
    func updateView() {
        if let details = trackDetails {
            output?.fillInfo(details)
        }
    }
}

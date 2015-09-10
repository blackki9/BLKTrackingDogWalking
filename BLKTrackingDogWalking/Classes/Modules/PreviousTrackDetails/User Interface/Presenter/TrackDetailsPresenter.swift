//
//  TrackDetailsPresenter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackDetailsPresenter: NSObject {
    var viewInterface:TrackDetailsViewInterface?
    var interactorIntput:TrackDetailsInteractorInput?
}

extension TrackDetailsPresenter : TrackDetailsModuleInterface {
    
}

extension TrackDetailsPresenter : TrackDetailsInteractorOutput {
    
}
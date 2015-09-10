//
//  NewTrackPresenter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class NewTrackPresenter: NSObject {
    var viewInterface:NewTrackViewInterface?
    var interactorInput:NewTrackInteractor?
}

extension NewTrackPresenter : NewTrackModuleInterface {
    
}

extension NewTrackPresenter : NewTrackInteractorOutput {
    
}
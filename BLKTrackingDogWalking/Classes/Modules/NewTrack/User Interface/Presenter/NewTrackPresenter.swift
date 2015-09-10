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
    let dateFormatter = NSDateFormatter()
    
    override init() {
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        super.init()
    }
}

extension NewTrackPresenter : NewTrackModuleInterface {
    func startTracking() {
        interactorInput?.startTracking()
    }
    
    func stopTracking() {
        interactorInput?.stopTracking()
    }
}

extension NewTrackPresenter : NewTrackInteractorOutput {
    func showTime(time:String) {
        viewInterface?.showTime(time)
    }
    
    func showDistance(distance:String) {
        viewInterface?.showDistance(distance)
    }
    
    func showDate(date:String) {
        viewInterface?.showDate(dateFormatter.stringFromDate(NSDate()))
    }
}
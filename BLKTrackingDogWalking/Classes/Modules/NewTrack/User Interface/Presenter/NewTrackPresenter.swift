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
    var dateFormatter:Formatter?
    var timeFormatter:Formatter?
    var distanceFormatter:Formatter?

}

extension NewTrackPresenter : NewTrackModuleInterface {
    func startTracking() {
        interactorInput?.startTracking()
    }
    
    func stopTracking() {
        interactorInput?.stopTracking()
    }
    
    func updateView() {
        if let formatter = dateFormatter {
            let string = formatter.format(NSDate())
            if let string = string {
                viewInterface?.showDate(string)
            }
        }
    }
}

extension NewTrackPresenter : NewTrackInteractorOutput {
    func showTime(time:Int) {
        if let formatter = timeFormatter {
            if let string = formatter.format(time) {
                viewInterface?.showTime(string)
            }
        }
        else {
            viewInterface?.showTime("00:00:00")
        }

    }
    
    func showDistance(distance:Double) {
        if let formatter = distanceFormatter {
            if let string = formatter.format(distance)  {
                viewInterface?.showDistance(string)
            }
        }
        else {
            viewInterface?.showDistance("0 m")    
        }
        
    }
    
    func showDate(date:NSDate) {
        if let formatter = dateFormatter {
            let string = formatter.format(date)
            if let string = string {
                viewInterface?.showDate(string)
            }
        }
        else {
            viewInterface?.showDate("No date")
        }
    }
    
    func trackSucceeded(succeded:Bool, reason:String) {
        viewInterface?.showAlertWithTitle("Track ended", message: reason)
    }
    
    func showNewLocation(longitude:Double,latitude:Double) {
        let locationShowItem = LocationShowItem(latitude:latitude,longitude:longitude)
        viewInterface?.showNewLocation(locationShowItem)
    }
}
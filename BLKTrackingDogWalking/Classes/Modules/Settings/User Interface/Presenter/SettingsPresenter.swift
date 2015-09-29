//
//  SettingsPresenter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class SettingsPresenter: NSObject {
    var userInterface:SettingsViewInterface?
    var interactor:SettingsInteractor?
    let distances = ["100","300", "500", "1000","1500","2000"]
}

extension SettingsPresenter : SettingsModuleInterface {
    func handleDistanceChange(row:Int) {
        interactor?.handleDistanceChange(distances[row])
    }
    
    func handleTimeChange(time:Int) {
        interactor?.handleTimeChange(time.description)
    }
    
    func fillInfo() {
        interactor?.fillInfo()
    }

    func distanceCount() -> Int {
        return distances.count
    }
    
    func distanceValueForRow(row:Int) -> String {
        return distances[row]
    }
}

extension SettingsPresenter : SettingsInteractorOutput {
    func showDistance(distance:String) {
        userInterface?.showDistance(distances.indexOf(distance)!)
    }
    
    func showTime(time:String) {
        userInterface?.showTime(Int(time)!)
    }
    
    func showError(reason: String) {
        userInterface?.showError(reason)
    }
}
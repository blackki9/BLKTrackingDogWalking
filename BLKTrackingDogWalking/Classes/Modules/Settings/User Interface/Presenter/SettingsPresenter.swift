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
}

extension SettingsPresenter : SettingsModuleInterface {
    func handleDistanceChange(distance:String) {
        interactor?.handleDistanceChange(distance)
    }
    
    func handleTimeChange(time:String) {
        interactor?.handleTimeChange(time)
    }
    
    func fillInfo() {
        interactor?.fillInfo()
    }

}

extension SettingsPresenter : SettingsInteractorOutput {
    func showDistance(distance:String) {
        userInterface?.showDistance(distance)
    }
    
    func showTime(time:String) {
        userInterface?.showTime(time)
    }
    
    func showError(reason: String) {
        userInterface?.showError(reason)
    }
}
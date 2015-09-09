//
//  AppDependencies.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class AppConfiguration {
    
    let trackListWireframe = TrackListWireFrame()
   
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerToWindow(window:UIWindow) {
        trackListWireframe.presentTrackListFromWindow(window)
    }
    
    func configureDependencies() {
        let dataStore = CoreDataStore()
        let rootWireframe = RootWireframe()
        
        trackListWireframe.rootWireframe = rootWireframe
        
        let trackListPresenter = TrackListPresenter()
        trackListWireframe.trackListPresenter = trackListPresenter
        trackListPresenter.trackListWireframe = trackListWireframe
        let settingsWireframe = SettingsWireframe()
        
        trackListWireframe.settingsWireframe = settingsWireframe
        
        let settingsPresenter = SettingsPresenter()
        settingsWireframe.presenter = settingsPresenter
        let settingsInteractor = SettingsInteractor()
        settingsPresenter.interactor = settingsInteractor
        settingsInteractor.output = settingsPresenter
        settingsInteractor.settingsManager = SettingsManager()
        
    }
    
}

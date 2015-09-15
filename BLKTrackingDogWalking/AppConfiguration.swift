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
    let trackManager = TracksManager()
    let dateFormatter = DateFormatter(formatString: "dd-MM-yyyy")
    let timeFormatter = TimeFormatter()
    let distanceFormatter = DistanceFormatter()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerToWindow(window:UIWindow) {
        trackListWireframe.presentTrackListFromWindow(window)
    }
    
    func configureDependencies() {
        trackManager.initLocationManager()
        
        let dataStore = CoreDataStore()
        let rootWireframe = RootWireframe()
        let settingsWireframe = SettingsWireframe()
        let newTrackWireframe = NewTrackWireframe()
        let trackDetailsWireframe = TrackDetailsWireframe()
        
        trackListWireframe.rootWireframe = rootWireframe
        trackListWireframe.newTrackWireframe = newTrackWireframe
        trackListWireframe.settingsWireframe = settingsWireframe
        trackListWireframe.trackDetailsWireframe = trackDetailsWireframe
        //set up track list
        let trackListPresenter = TrackListPresenter()
        trackListWireframe.trackListPresenter = trackListPresenter
        trackListPresenter.trackListWireframe = trackListWireframe
        let trackListInteractor = TrackListInteractor(dataManager: TracksDataManager(coreDataStore: dataStore))
        trackListInteractor.output = trackListPresenter
        trackListPresenter.trackListInteractorInput = trackListInteractor
        
        //set up settings
        let settingsPresenter = SettingsPresenter()
        settingsWireframe.presenter = settingsPresenter
        let settingsInteractor = SettingsInteractor()
        settingsPresenter.interactor = settingsInteractor
        settingsInteractor.output = settingsPresenter
        settingsInteractor.settingsManager = SettingsManager(userDefaults: NSUserDefaults.standardUserDefaults())
        
        //set up new track
        let newTrackPresenter = NewTrackPresenter()
        newTrackWireframe.presenter = newTrackPresenter
        let newTrackInteractor = NewTrackInteractor()
        newTrackPresenter.interactorInput = newTrackInteractor
        newTrackPresenter.dateFormatter = dateFormatter
        newTrackPresenter.timeFormatter = timeFormatter
        newTrackPresenter.distanceFormatter = distanceFormatter
        newTrackInteractor.output = newTrackPresenter
        let newTrackDataManager = NewTrackDataManager(dataStore: dataStore)
        newTrackDataManager.tracksManager = trackManager
        newTrackInteractor.dataManager = newTrackDataManager

        //set up track details
        let trackDetailsPresenter = TrackDetailsPresenter()
        let trackDetailsInteractor = TrackDetailsInteractor()
        trackDetailsWireframe.presenter = trackDetailsPresenter
        trackDetailsPresenter.interactorIntput = trackDetailsInteractor
        trackDetailsInteractor.output = trackDetailsPresenter
        
    }
    
}

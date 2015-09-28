//
//  TrackListPresenter.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackListPresenter: NSObject,TrackListModuleInterface {
 
    var trackListInteractorInput:TrackListInteractorInput?
    var trackListWireframe:TrackListWireFrame?
    var userInterface:TrackListInterface?
    
    func showSettings() {
        trackListWireframe?.showSettings()
    }
    
    func addTrack() {
        trackListWireframe?.addTrack()
    }
    
    func showTrackDetailsWithIndex(details:TrackListItem) {        trackListWireframe?.showTrackDetails(details)
    }
    
    func updateData() {
        trackListInteractorInput?.findAllTracks()
    }
    
    func deleteItem(item: TrackListItem) {
        
    }
    
}

extension TrackListPresenter : TrackListInteractorOutput {
    func tracksFound(tracks:[TrackListItem]) {
        userInterface?.tracksFound(tracks)
    }
}
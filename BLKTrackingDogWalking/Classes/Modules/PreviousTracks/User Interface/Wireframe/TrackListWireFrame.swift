//
//  TrackListWireFrame.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

let TrackListControllerId = "TrackListControllerId"

class TrackListWireFrame: NSObject {
   
    var rootWireframe:RootWireframe?
    var settingsWireframe:SettingsWireframe?
    var trackListPresenter:TrackListPresenter?
    var trackListViewController:TrackListViewController?
    var newTrackWireframe:NewTrackWireframe?
    var trackDetailsWireframe:TrackDetailsWireframe?
    
    func presentTrackListFromWindow(window:UIWindow) {
        let viewController = trackListControllerFromStoryboard()
        trackListViewController = viewController
        trackListViewController?.eventHandler = trackListPresenter
        trackListPresenter?.userInterface = trackListViewController
        
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    func trackListControllerFromStoryboard() -> TrackListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewControllerWithIdentifier(TrackListControllerId) as! TrackListViewController
        
        return viewController
    }
    
    //MARK : - show screens
    
    func addTrack() {
        newTrackWireframe?.presentNewTrackFromViewController(trackListViewController!)
    }
    
    func showSettings() {
        settingsWireframe?.presentSettingsFromViewController(trackListViewController)
    }
    
    func showTrackDetails(details:TrackListItem) {
        trackDetailsWireframe?.presentTrackDetailsFromViewController(trackListViewController!,trackItem:details)
    }
    
}

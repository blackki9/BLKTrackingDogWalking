//
//  TrackDetailsWireframe.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackDetailsWireframe: NSObject {
    var presenter:TrackDetailsPresenter?
    var presentedViewController:TrackDetailsViewController?
    var interactor:TrackDetailsInteractor?
    
    func presentTrackDetailsFromViewController(viewController:UIViewController,trackItem:TrackListItem) {
        let newController = trackDetailsControllerFromStoryboard()
        presentedViewController = newController
        newController.eventHandler = presenter
        presenter?.viewInterface = newController
        interactor?.trackDetails = trackItem
        viewController.navigationController?.pushViewController(newController, animated: true)
    }
    func trackDetailsControllerFromStoryboard() -> TrackDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier(TrackDetailsViewController.storyboardId) as! TrackDetailsViewController
        
        return viewController
    }
}

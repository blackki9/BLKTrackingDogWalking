//
//  NewTrackWireframe.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class NewTrackWireframe: NSObject {
    var presenter:NewTrackPresenter?
    var presentedViewController:NewTrackViewController?
    
    func presentNewTrackFromViewController(viewController:UIViewController) {
        let newController = newTrackControllerFromStoryboard()
        presentedViewController = newController
        newController.eventHandler = presenter
        presenter?.viewInterface = newController
        viewController.navigationController?.pushViewController(newController, animated: true)
    }
    func newTrackControllerFromStoryboard() -> NewTrackViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier(NewTrackViewController.storyboardId) as! NewTrackViewController
        
        return viewController
    }
}

//
//  SettingsWireframe.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

let SettingsViewControllerId = "SettingsViewController"

class SettingsWireframe: NSObject {

    var presentedViewController:UIViewController?
    var presenter:SettingsPresenter?
    
    func presentSettingsFromViewController(viewController:UIViewController?) {
        let newController = settingsController()
        newController.eventHandler = presenter
        presenter?.userInterface = newController
        viewController?.navigationController!.pushViewController(newController, animated: true)
        
        presentedViewController = newController
    }
    
    func dismissViewController() {
        presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func settingsController() -> SettingsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
    }
}

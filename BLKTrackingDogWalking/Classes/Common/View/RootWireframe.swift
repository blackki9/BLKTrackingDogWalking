//
//  RootWireframe.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class RootWireframe: NSObject {
   
    func showRootViewController(rootViewController:UIViewController, inWindow:UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [rootViewController]
    }
    
    func navigationControllerFromWindow(window:UIWindow) -> UINavigationController {
        return window.rootViewController as! UINavigationController
    }
    
}

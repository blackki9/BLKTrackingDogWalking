//
//  TrackDetailsViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackDetailsViewController: UIViewController,TrackDetailsViewInterface {

    var eventHandler:TrackDetailsModuleInterface?
    static let storyboardId = "TrackDetailsViewInterface"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Track details"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TrackDetailsViewController : TrackDetailsViewInterface {
    
}

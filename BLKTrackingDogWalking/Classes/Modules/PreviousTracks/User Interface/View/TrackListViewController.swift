//
//  TrackListViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController, TrackListInterface {

    var eventHandler:TrackListModuleInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTrack(sender: AnyObject) {
        eventHandler?.addTrack()
    }

    @IBAction func showSettings(sender: AnyObject) {
        eventHandler?.showSettings()
    }
    
}

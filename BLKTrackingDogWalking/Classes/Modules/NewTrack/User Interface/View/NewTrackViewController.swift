//
//  NewTrackViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class NewTrackViewController: UIViewController {

    static let storyboardId = "NewTrackViewController"
    
    var eventHandler:NewTrackModuleInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New track"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NewTrackViewController : NewTrackViewInterface {
    
}

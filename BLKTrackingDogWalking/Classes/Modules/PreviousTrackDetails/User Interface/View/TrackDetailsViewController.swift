//
//  TrackDetailsViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import MapKit

class TrackDetailsViewController: UIViewController,TrackDetailsViewInterface {
    //MARK:- properties
    var eventHandler:TrackDetailsModuleInterface?
    static let storyboardId = "TrackDetailsViewInterface"
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    //MARK:- UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Track details"
        mapView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler?.updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- MKMapViewDelegate

extension TrackDetailsViewController:MKMapViewDelegate {
    
}

 //MARK:- view interface
extension TrackDetailsViewController : TrackDetailsViewInterface {
    func showDate(dateString:String) {
        dateLabel.text = dateString
    }
    
    func showTime(timeString:String) {
        timeLabel.text = timeString
    }
    
    func showDistance(distanceString:String) {
        distanceLabel.text = distanceString
    }
}

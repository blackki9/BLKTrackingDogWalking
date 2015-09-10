//
//  NewTrackViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import MapKit

class NewTrackViewController: UIViewController {

    static let storyboardId = "NewTrackViewController"
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var currentDistanceLabel: UILabel!
    @IBOutlet var currentTimeLabel: UILabel!
    
    @IBOutlet var currentDateLabel: UILabel!
    var eventHandler:NewTrackModuleInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New track"
        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let userLocation = mapView.userLocation {
            let region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 250, 250)
            mapView.setRegion(region, animated: true)
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- IBActions
    
    @IBAction func startTracking(sender: AnyObject) {
        eventHandler?.startTracking()
    }
    
    @IBAction func stopTracking(sender: AnyObject) {
        eventHandler?.stopTracking()
    }
}

extension NewTrackViewController : MKMapViewDelegate {
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
    }

}

extension NewTrackViewController : NewTrackViewInterface {
    func showTime(time: String) {
        currentTimeLabel.text = time
    }
    
    func showDistance(distance: String) {
        currentDistanceLabel.text = distance
    }
    
    func showDate(date: String) {
        currentDateLabel.text = date
    }
}

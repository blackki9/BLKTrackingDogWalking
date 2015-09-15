//
//  NewTrackViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import MapKit

let mapRegionBoneSize = 1000.0

class NewTrackViewController: UIViewController {

    //MARK:-properties
    
    static let storyboardId = "NewTrackViewController"
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var currentDistanceLabel: UILabel!
    @IBOutlet var currentTimeLabel: UILabel!
    
    @IBOutlet var currentDateLabel: UILabel!
    var eventHandler:NewTrackModuleInterface?
    
    //MARK:- UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New track"
        mapView.showsUserLocation = true
        mapView.delegate = self
        // Do any additional setup after loading the view.
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

//MARK:- MKMapViewDelegate

extension NewTrackViewController : MKMapViewDelegate {
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
    }
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        if let userLocation = mapView.userLocation {
            let region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, mapRegionBoneSize, mapRegionBoneSize)
            mapView.setRegion(region, animated: true)
        }
    }

}

//MARK:- NewTrackViewInterface

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

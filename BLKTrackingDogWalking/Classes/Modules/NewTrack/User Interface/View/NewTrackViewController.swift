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

    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    var updatedUserPosition = false

    private var locations = [LocationShowItem]()
    
    @IBOutlet var currentDateLabel: UILabel!
    var eventHandler:NewTrackModuleInterface?
    
    //MARK:- UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New track"
        eventHandler?.updateView()
        mapView.showsUserLocation = true
        mapView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        eventHandler?.stopTracking()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- IBActions
    
    @IBAction func startTracking(sender: AnyObject) {
        locations.removeAll(keepCapacity: false)
        startButton.hidden = true
        stopButton.hidden = false
        eventHandler?.startTracking()
    }
    
    @IBAction func stopTracking(sender: AnyObject) {
        startButton.hidden = false
        stopButton.hidden = true
        eventHandler?.stopTracking()
    }
    
    //MARK:- path handling
    
    func updatePath() {
        if locations.count > 1 {
            var coords = [CLLocationCoordinate2D]()
            let lastLocation = locations.last
            let previousLocation = locations[locations.count - 2]
            
            let lastCoordinate = CLLocationCoordinate2D(latitude: lastLocation!.latitude, longitude: lastLocation!.longitude)
            let previousCoordinate = CLLocationCoordinate2D(latitude: previousLocation.latitude, longitude: previousLocation.longitude)
            coords.append(previousCoordinate)
            coords.append(lastCoordinate)

            let region = MKCoordinateRegionMakeWithDistance(coords.last!, 500, 500)
            mapView.setRegion(region, animated: true)
            mapView.addOverlay(MKPolyline(coordinates: &coords, count: coords.count))
        }
    }
}

//MARK:- MKMapViewDelegate

extension NewTrackViewController : MKMapViewDelegate {
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    }
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        if !updatedUserPosition {
                let region = MKCoordinateRegionMakeWithDistance(mapView.userLocation.coordinate, mapRegionBoneSize, mapRegionBoneSize)
                mapView.setRegion(region, animated: true)
                updatedUserPosition = true
        }
   
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        
        //TODO:- change to guard
        if !overlay.isKindOfClass(MKPolyline) {
            return nil
        }
        
        let polyline = overlay as! MKPolyline
        let renderer = MKPolylineRenderer(polyline: polyline)
        
        renderer.strokeColor = UIColor.blueColor()
        renderer.lineWidth = 3.0
        
        return renderer
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
    
    func showNewLocation(location:LocationShowItem) {
        locations.append(location)
        updatePath()
    }
    
    func showAlertWithTitle(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
            
        }))
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

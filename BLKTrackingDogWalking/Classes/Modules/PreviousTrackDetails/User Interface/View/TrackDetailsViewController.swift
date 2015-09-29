//
//  TrackDetailsViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import MapKit

class TrackDetailsViewController: UIViewController {
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
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        //TODO:- change to guard
        if !overlay.isKindOfClass(MKPolyline) {
            return nil
        }
        let polyline = overlay as! MKPolyline
        let renderer = MKPolylineRenderer(polyline: polyline)
        
        renderer.lineWidth = 4.0
        renderer.strokeColor = UIColor.blueColor()

        return renderer
    }
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
    
    func showRegion(region:MKCoordinateRegion) {
        mapView.region = region
    }
    
    func showPath(path:MKPolyline) {
        mapView.addOverlay(path)
    }
}

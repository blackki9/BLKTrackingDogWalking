//
//  TracksManager.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 10/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import CoreLocation

class TracksManager: NSObject {
    var timer:NSTimer?
    var locations = [CLLocation]()
    let locationManager = CLLocationManager()
    var seconds:Int = 0
    var meters:Double = 0.0
    var progressBlock:((seconds:Int,distance:Int, location:CLLocation?) -> ())?
    
    func updateTime() {
        seconds++
        if let block = progressBlock {
            block(seconds: seconds,distance:Int(meters),location:locations.last)
        }
    }
    
    func initLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = CLActivityType.Fitness
        locationManager.distanceFilter = 10
    if(locationManager.respondsToSelector("requestAlwaysAuthorization")) {
            locationManager.requestAlwaysAuthorization()
        }
    }
}

extension TracksManager : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let arrayOfLocations = locations 
        for newLocation in arrayOfLocations {
            if newLocation.horizontalAccuracy < 20 {
                if let lastLocation = self.locations.last {
                    meters += newLocation.distanceFromLocation(lastLocation)
                }
                
                self.locations.append(newLocation)
            }
        }
    }
}

extension TracksManager: TracksManagerInterface {
    
    func isStopped() -> Bool {
        if let valid =  timer?.valid {
            return !valid
        }
        
        return true
    }
    
    func allLocations() -> [Location] {
        return locations.map({ (object:CLLocation) -> Location in
            let newLocation = Location(longitude: object.coordinate.longitude, latitude: object.coordinate.latitude, timestamp: object.timestamp)
            
            return newLocation
        })
    }
    
    func startTracking(progressBlock:((seconds:Int,distance:Int,location:CLLocation?) -> ())?) {
        seconds = 0
        meters = 0
        self.progressBlock = progressBlock
        
        if let valid = timer?.valid {
            if valid {
                timer?.invalidate()
            }
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        
        locationManager.startUpdatingLocation()
       
    }
    
    func stopTracking() {
        if let timer = timer {
            timer.invalidate()
        }
        locations.removeAll()
    }
}

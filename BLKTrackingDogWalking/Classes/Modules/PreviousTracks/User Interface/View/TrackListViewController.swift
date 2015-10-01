//
//  TrackListViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController {

    //MARK:- properties
    
    var eventHandler:TrackListModuleInterface?
    var tracks:[TrackListItem]?
    
    @IBOutlet var tracksTableView: UITableView!
    
    //MARK:- UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.tracksTableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler?.updateData()
    }
    
    //MARK:- IBActions
    
    @IBAction func addTrack(sender: AnyObject) {
        eventHandler?.addTrack()
    }

    @IBAction func showSettings(sender: AnyObject) {
        eventHandler?.showSettings()
    }
    
}

//MARK:- TrackListInterface impl

extension TrackListViewController : TrackListInterface {
    func tracksFound(tracks:[TrackListItem]) {
        if tracks.count > 0 {
            self.tracks = tracks
        }
        tracksTableView.reloadData()
    }
}

//MARK:- UITableViewDataSource impl

extension TrackListViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tracks = self.tracks {
            return tracks.count
        }
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let tracks = self.tracks {
            let cell = tableView.dequeueReusableCellWithIdentifier(TrackListTableViewCell.cellId, forIndexPath: indexPath) as! TrackListTableViewCell
            let track = tracks[indexPath.row]
            
            cell.currentDateLabel.text = track.dateOfWalking
            cell.currentDistanceLabel.text = track.distancePassed
            cell.currentTimeLabel.text = track.timeElapsed
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(TrackListNoItemTableViewCell.reusableCellId, forIndexPath: indexPath)
        
        return cell
       
    }
}

//MARK:- UITableViewDelegate impl

extension TrackListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let tracks = self.tracks {
            eventHandler?.showTrackDetailsWithIndex(tracks[indexPath.row])
        }
        else {
            eventHandler?.addTrack()
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if let _ = self.tracks {
            return true
        }

        return false
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let removedItem = tracks?.removeAtIndex(indexPath.row)
            if let item = removedItem {
                eventHandler?.deleteItem(item)
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
}
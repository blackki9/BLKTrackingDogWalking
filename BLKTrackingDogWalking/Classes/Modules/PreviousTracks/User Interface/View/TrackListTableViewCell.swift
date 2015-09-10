//
//  TrackListTableViewCell.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class TrackListTableViewCell: UITableViewCell {

    static let cellId = "TrackListTableViewCellId"
    
    @IBOutlet var currentDateLabel: UILabel!
    @IBOutlet var currentDistanceLabel: UILabel!
    @IBOutlet var currentTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}

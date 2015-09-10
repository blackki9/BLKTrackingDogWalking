//
//  NewTrackDataManager.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 09/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class NewTrackDataManager: NSObject {
    let dataStore:CoreDataStore
    
    init(dataStore:CoreDataStore) {
        self.dataStore = dataStore
        super.init()
    }
}

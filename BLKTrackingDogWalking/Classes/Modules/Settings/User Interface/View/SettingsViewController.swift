//
//  SettingsViewController.swift
//  BLKTrackingDogWalking
//
//  Created by black9 on 08/09/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var eventHandler:SettingsModuleInterface?
    
    @IBOutlet var timePicker: UIDatePicker!
    @IBOutlet var distancePicker: UIPickerView!
    //MARK:- UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        timePicker.addTarget(self, action: "timeChanged:", forControlEvents: .ValueChanged)
        distancePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func timeChanged(picker:UIDatePicker) {
        let minutes = picker.countDownDuration / 60
        eventHandler?.handleTimeChange(Int(minutes))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler?.fillInfo()
    }
}

extension SettingsViewController : UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let handler = self.eventHandler {
            return handler.distanceCount()
        }
        return 0
    }
}

extension SettingsViewController : UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let handler = eventHandler {
            return handler.distanceValueForRow(row)
        }
        return nil
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        eventHandler?.handleDistanceChange(row)
    }

}

extension SettingsViewController : SettingsViewInterface {
    func showDistance(row:Int) {
        distancePicker.selectRow(row, inComponent: 0, animated: true)
    }
    
    func showTime(timeInterval:Int) {
        timePicker.countDownDuration = NSTimeInterval(timeInterval * 60)
    }
    
    func showError(reason: String) {
        let alert = UIAlertController(title: "Error", message: reason, preferredStyle: UIAlertControllerStyle.Alert)
    
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler:nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }

}

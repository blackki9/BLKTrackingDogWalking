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

    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var timeField: UITextField!
    
    //MARK:- UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        eventHandler?.fillInfo()
        distanceTextField.delegate = self
        timeField.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension SettingsViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == distanceTextField {
            eventHandler?.handleDistanceChange(distanceTextField.text)
        }
        else if textField == timeField {            eventHandler?.handleTimeChange(timeField.text)
        }
        
        textField.resignFirstResponder()
        return true
    }
}

extension SettingsViewController : SettingsViewInterface {
    func showDistance(distance:String) {
        distanceTextField.text = distance
    }
    
    func showTime(time:String) {
        timeField.text = time
    }
    
    func showError(reason: String) {
        let alert = UIAlertController(title: "Error", message: reason, preferredStyle: UIAlertControllerStyle.Alert)
    
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler:nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }

}

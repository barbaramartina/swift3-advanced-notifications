//
//  ViewController.swift
//  AdvanceNotifications
//
//  Created by Barbara Rodeker on 28/09/16.
//  Copyright © 2016 Barbara Rodeker. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    private func checkNotificationsPermissions() {
    
        UNUserNotificationCenter.current().getNotificationSettings(){ (setttings) in
            
            switch setttings.alertSetting {
            case .enabled:
                print("enabled alert setting")
            case .disabled:
                print("setting disabled")
            case .notSupported:
                print("something went wrong here")
            }
        }
    }
}


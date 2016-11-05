//
//  NotificationViewController.swift
//  Content
//
//  Created by Barbara Rodeker on 28/09/16.
//  Copyright © 2016 Barbara Rodeker. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = view.bounds.size
        preferredContentSize = CGSize(width: size.width, height: size.width)
    }
    
    func didReceive(_ notification: UNNotification) {
        self.titleText.text = notification.request.content.title
        
        if let attachment = notification.request.content.attachments.first {
            if attachment.url.startAccessingSecurityScopedResource() {
                if let data = NSData(contentsOfFile: attachment.url.path) as? Data {
                    picture.image = UIImage(data: data)
                    attachment.url.stopAccessingSecurityScopedResource()
                }
            }
        }
    }
    
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        
        if response.actionIdentifier == "LIKE-1" {
            //TODO: do something with the like / might be communicate to server
        } else if response.actionIdentifier == "HATE-1" {
            //TODO: do something with the "hate" / might be communicate to server
            // Here we will suppose that we want more information from the user: why does he hate cats / dogs?
            if let response = response as? UNTextInputNotificationResponse {
                print(response.userText)
            }
            // Dismiss the notification
            completion(.dismiss)
            
        } else if response.actionIdentifier == "MORE-1" {
            // Dismiss the notification and open the app
            completion(.dismissAndForwardAction)
        }
    }

}

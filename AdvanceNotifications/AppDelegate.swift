//
//  AppDelegate.swift
//  AdvanceNotifications
//
//  Created by Barbara Rodeker on 28/09/16.
//  Copyright © 2016 Barbara Rodeker. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        In iOS 8 and later, apps that use either local or remote notifications must register the types of user interactions the app supports. Apps can ask to badge icons, display alert messages, or play sounds. When you request any of these interaction types, the system checks the types of interactions the user has allowed for your app. If the user has disallowed a particular type of interaction, the system ignores attempts to interact with the user in that way.
        
//        The user can change the notification settings for your app at any time using the Settings app. Because settings can change, always call the registerUserNotificationSettings: at launch time and use the application:didRegisterUserNotificationSettings: method to get the response.
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert]) { (granted, error) in
                //TODO: process to match your app logic
        }
        application.registerForRemoteNotifications()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)

        //TODO: forward the token to your servers
        
        registerNotificationCategories()
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Error registering for remote notifications \(error)")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate {

//    In addition to registering your app’s interaction types, apps can register one or more categories. Categories are supported for both local and remote notifications, and you use them to identify the purpose of the notification
    fileprivate func registerNotificationCategories() {
    
        let like1ID = "LIKE-1"
        let hate1ID = "HATE-1"
        let more1ID = "MORE-1"
        
//        Starting in iOS 8, you can optionally create actionable notifications by registering custom actions for a notification type. When an actionable notification arrives, the system creates a button for each registered action and adds those buttons to the notification interface
        
        let like1Action = UNNotificationAction(identifier: like1ID, title: "I love cats!", options: .authenticationRequired)
        let hate1Action = UNTextInputNotificationAction(identifier: hate1ID, title: "I have cats!", options: [.destructive], textInputButtonTitle: "Send", textInputPlaceholder: "why?")
        let more1Action = UNNotificationAction(identifier: more1ID, title: "Show me more", options: .foreground)
        
        let category1 = UNNotificationCategory(identifier: "any-name-1", actions: [like1Action,hate1Action,more1Action], intentIdentifiers: [like1ID, hate1ID, more1ID], options: [])
        
        let like2ID = "LIKE-2"
        
        let like2Action = UNNotificationAction(identifier: like2ID, title: "I love dogs!", options: [])
        
        let category2 = UNNotificationCategory(identifier: "any-name-2", actions: [like2Action], intentIdentifiers: [like2ID], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category1,category2])
    }

}


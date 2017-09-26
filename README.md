# Advanced Notifications in Swift 3

### Find more information 
In my blog [Lady&Tech](http://www.barbararodeker.com/ladyandtech/?p=100)

## Intro
With iOS 10 release, this year in September, 2 new frameworks came to power-up notifications. UserNotifications and UserNotificationsUI.You will find an example implementation in this repository. Based on that I've written the article with further explanations.

### The project needs to be adjusted to your own credentials, team and entitlements in order to work on devices and be tested. You can use it as a guide for your own requirements and copy paste any part of the code if it's useful to you.

## How things work?

### For a quick reference about how the notification cycle will work for advanced notifications I have created the following graphic.

![General Flow](http://www.barbararodeker.com/ladyandtech/wp-content/uploads/2016/10/Drawing-1-753x433.png)

You server will send push notifications, once in the device, the operative system will check if the flag mutable-content is there.

If it’s the case, then will call the NotificationExtension target created in the project, there you have the possibility to download or prepare additional content.

Then the push notification will be presented.

The notification payload could have (not mandatory) a category, when the user force touch, or swipe to left (in devices with no force touch), if the category is present, the system will check which of you ContentExtensions handle that category and will call it. Then the extended UI can be generated.

After all the cycle your custom UI for the advanced notification will be presented.


## What needs to be implemented?

1. Create a service extension target in your app
2. Create a content extension target in your app
3. Decide which categories you will need
4. Declares the category/ies you will handle in your content extension
5. Define your payload, make your advanced notifications mutable and define a category.
6. Implement the service extension
7. Implement the content extension and the UI
8. Add actions if required
9. Associate the categories with the actions
10. Handle actions in your content extension if required
11. DEBUG Put everything together and polish the details

#### You will find the steps detailed in the [article](http://www.barbararodeker.com/ladyandtech/?p=100).


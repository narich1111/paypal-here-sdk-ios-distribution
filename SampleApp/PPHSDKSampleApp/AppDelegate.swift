
//  AppDelegate.swift
//  PPHSDKSampleApp
//
//  Created by Wright, Cory on 11/16/16.
//  Copyright © 2016 cowright. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
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

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        // Gather the SdkCredential info from the sample server.
        let accessToken = url.valueOf("access_token")
        let refreshUrl = url.valueOf("refresh_url")
        let environment = url.valueOf("env")

        // Save token to UserDefaults for further usage
        let tokenDefault = UserDefaults.init()
        tokenDefault.set(accessToken, forKey: "ACCESS_TOKEN")
        tokenDefault.set(refreshUrl, forKey: "REFRESH_URL")
        tokenDefault.set(environment, forKey: "ENVIRONMENT")
        
        // Use the notification service to send the token to the InitializeViewController
        if (sourceApplication == "com.apple.SafariViewService") {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kCloseSafariViewControllerNotification), object: accessToken)
            return true
        }
        
        return true
        
    }

}

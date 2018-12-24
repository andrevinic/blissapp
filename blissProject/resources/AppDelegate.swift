//
//  AppDelegate.swift
//  blissProject
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Starts monitoring network reachability status changes
        ReachabilityManager.shared.startMonitoring()
    }
    func applicationWillEnterForeground(_ application: UIApplication){
        // Stops monitoring network reachability status changes
        ReachabilityManager.shared.stopMonitoring()
    }

}


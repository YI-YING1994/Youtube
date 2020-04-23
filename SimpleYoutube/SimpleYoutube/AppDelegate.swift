//
//  AppDelegate.swift
//  SimpleYoutube
//
//  Created by MCUCSIE on 10/25/18.
//  Copyright © 2018 MCUCSIE. All rights reserved.
//

import UIKit
import FirebaseCore
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FIRApp.configure()
        return true
    }
}


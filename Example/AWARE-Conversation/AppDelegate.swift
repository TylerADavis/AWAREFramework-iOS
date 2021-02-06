//
//  AppDelegate.swift
//  AWARE-Conversation
//
//  Created by Yuuki Nishiyama on 2019/09/26.
//  Copyright © 2019 tetujin. All rights reserved.
//

import UIKit
import AWAREFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

        let core = AWARECore.shared()
        core.requestPermissionForBackgroundSensing { (status) in
            core.startBaseLocationSensor()
            let conversation = Conversation(awareStudy: AWAREStudy.shared())
            conversation.startSensor()
            conversation.setSensorEventHandler { (sensor, data) in
                print(data)
            }
            conversation.setDebug(true)
            let manager = AWARESensorManager.shared()
            manager.add(conversation)
            manager.startAllSensors()
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


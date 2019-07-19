//
//  AppDelegate.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit
import Firebase



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Let's initiliaze window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1)
        
        // Let's check if user availability
//        if Auth.auth().currentUser != nil {
//            print("home")
////            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
//        }
        if !SESSION.IsAppLaunchFirstTime() {
            // Show home page
            let mainViewController = ARViewController.instantiate(from: .Main)
            let navVC = UINavigationController.init(rootViewController: mainViewController)
            self.window?.rootViewController = navVC
        } else {
            // Show login page
            let loginViewController = LoginViewController.instantiate(from: .Main)
            SESSION.setAppLaunchIsFirstTime(isLogin: false)
            self.window?.rootViewController = loginViewController
        }
        
        self.window?.makeKeyAndVisible()
        FirebaseApp.configure()
        
        //Localization
        SESSION.setUserPreferredLanguage(aStrUserLang: "ta-IN")//kn //hi
        
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


}


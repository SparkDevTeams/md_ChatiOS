//
//  AppDelegate.swift
//  Perimeter
//
//  Created by Davone Barrett on 9/7/18.
//  Copyright © 2018 SparkDev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // overboarding
        window = UIWindow()
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let onboardingStoryBoard = UIStoryboard(name: "Onboarding", bundle: nil)
        
        let isSetupComplete = UserDefaults.standard.bool(forKey: "isSetupComplete")
        if (isSetupComplete){
            // show the onboarding screen
            
        } else {
            // show the main screen
            let vc = onboardingStoryBoard.instantiateViewController(withIdentifier: "onboardingPageViewController") as! OnboardingPageViewController
            window?.rootViewController = vc
            print("showing onboarding screen")
            window?.makeKeyAndVisible()

        }
        
        

        // Override point for customization after application launch.
        
        // Firebase Initialization
        FirebaseApp.configure()
       
        // configure tabbar bar view
        //configureTabBarView()

        
        return true;
    }
    
    func configureTabBarView() {
        let settingsVc = SettingsTableViewController(style: .grouped)
        let inboxVc = InboxTableViewController(style: .plain)
        
        let settingsNc = UINavigationController(rootViewController: settingsVc)
        let inboxNc = UINavigationController(rootViewController: inboxVc)
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([inboxNc, settingsNc], animated: true)
        
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
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


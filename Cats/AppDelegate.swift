//
//  AppDelegate.swift
//  Cats
//
//  Created by Lígia Maria on 06/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 15, *) {
            let tabBarAppearance: UITabBarAppearance = .init()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = .systemMint
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
        let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
        let viewController: TabBarViewController = TabBarViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}


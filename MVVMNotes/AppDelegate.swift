//
//  AppDelegate.swift
//  MVVMNotes
//
//  Created by Evan Grossman on 12/17/16.
//  Copyright © 2016 Evan Grossman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let noteListVC = NotesListViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = .white
            window.rootViewController = UINavigationController(rootViewController: noteListVC)
            window.makeKeyAndVisible()
        }
        
        return true
    }

}


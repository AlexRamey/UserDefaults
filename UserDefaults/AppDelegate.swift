//
//  AppDelegate.swift
//  UserDefaults
//
//  Created by Alex Ramey on 1/5/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        registerDefaults()
        
        return true
    }
    
    /*
     registerDefaults() sets initial values for user preferences in the Registration Domain
     of UserDefaults, which is an in-memory store. If the user later selects preference values,
     they will be saved in the persistent Application Domain. Values is the Application Domain
     will always trump their counterparts in the Registration Domain.
    */
    func registerDefaults(){
        
        // ALABAMA CRIMSON: 158,27,50
        let rollTide = UIColor(red: 158.0/255.0, green: 27.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        let defaults = [ THEME_COLOR_KEY : NSKeyedArchiver.archivedData(withRootObject: rollTide) ]
        
        UserDefaults.standard.register(defaults: defaults)
    }
}


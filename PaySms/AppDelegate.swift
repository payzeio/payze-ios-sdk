//
//  AppDelegate.swift
//  PaySms
//
//  Created by Irakli Shelia on 29.11.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController")
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }
}

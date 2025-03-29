//
//  AppDelegate.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        print("🚀 AppDelegate didFinishLaunchingWithOptions called")

        window = UIWindow(frame: UIScreen.main.bounds)
        print("🖥️ Window created: \(String(describing: window))")

        let contactsVC = ContactsViewController()

        print("📱 ContactsViewController created: \(contactsVC)")

        let navigationController = UINavigationController(rootViewController: contactsVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        print("✅ Window is now visible")
        return true
    }
}

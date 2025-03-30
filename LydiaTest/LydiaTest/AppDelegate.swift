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

        window = UIWindow(frame: UIScreen.main.bounds)

        let contactsVC = ContactsViewController()

        let navigationController = UINavigationController(rootViewController: contactsVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

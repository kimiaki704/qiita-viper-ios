//
//  AppDelegate.swift
//  QiitaVIPER
//
//  Created by Suzuki Kimiaki on 2020/05/02.
//  Copyright © 2020 Suzuki Kimiaki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentArticleListViewController(in: window!)
        return true
    }
}

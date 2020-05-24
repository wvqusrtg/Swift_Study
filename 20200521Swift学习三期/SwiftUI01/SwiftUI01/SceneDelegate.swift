//
//  SceneDelegate.swift
//  SwiftUI01
//
//  Created by nixs on 2020/5/21.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class SceneDelegate: UIResponder, UIWindowSceneDelegate,UIApplicationDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowsScene = scene as? UIWindowScene {
            //1
            let window = UIWindow(windowScene: windowsScene)
            self.window = window
            //2
            let vc = UIHostingController(rootView: AwesomeView())
            window.rootViewController = vc
            //3
            window.makeKeyAndVisible()
            
        }
    }
}


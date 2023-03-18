//
//  SceneDelegate.swift
//  MoveScreen+Coordinator
//
//  Created by 박준하 on 2023/03/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window

            let navigationController = UINavigationController()
            self.window?.rootViewController = navigationController
            
            let coordinator = AppCoordinator(navigationController: navigationController)
            coordinator.start()
            
            self.window?.makeKeyAndVisible()
        }
    }

}


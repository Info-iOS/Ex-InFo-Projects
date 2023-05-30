//
//  SceneDelegate.swift
//  Text1
//
//  Created by 박준하 on 2023/04/14.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let rootNavigationController = UINavigationController(rootViewController: ViewController())
        
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
    }
}

//
//  TabBarController.swift
//  InstagramClone
//
//  Created by 박준하 on 2023/03/15.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedViewContoller = UINavigationController(rootViewController: FeedViewController())
        feedViewContoller.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let plusViewController = UINavigationController(rootViewController: UIViewController())
        plusViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "plus.app"), selectedImage: UIImage(systemName: "plus.app"))
        
        let profileViewController = UINavigationController(rootViewController: ProfiledViewController())
        profileViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        viewControllers = [feedViewContoller,plusViewController, profileViewController]
    }
}

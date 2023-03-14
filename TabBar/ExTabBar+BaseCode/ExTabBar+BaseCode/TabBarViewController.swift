//
//  TabBarViewController.swift
//  ExTabBar+BaseCode
//
//  Created by 박준하 on 2023/03/14.
//

import UIKit
import Then
import SnapKit

class TapBarViewController : UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = UINavigationController(rootViewController: ViewController1())
        let tabOneBarItem = UITabBarItem(title: "",
                                         image: UIImage(systemName: "house"),
                                         tag: 1)
        
        homeVC.tabBarItem = tabOneBarItem
        
        let chartVC = UINavigationController(rootViewController: ViewController2())
        let tabTwoBarItem2 = UITabBarItem(title: "",
                                          image: UIImage(systemName: "chart.bar.fill"),
                                          tag: 2)
        
        chartVC.tabBarItem = tabTwoBarItem2
        
        let searchVC = UINavigationController(rootViewController: ViewController3())
        let tabThrBarItem3 = UITabBarItem(title: "",
                                          image: UIImage(systemName: "magnifyingglass"),
                                          tag: 3)
        
        searchVC.tabBarItem = tabThrBarItem3
        
        self.tabBar.tintColor = UIColor(named: "errorColor")
        self.tabBar.unselectedItemTintColor = .white
        self.viewControllers = [homeVC, chartVC, searchVC]
        self.tabBar.backgroundColor = UIColor(named: "CollectionViewColor")
    }
}

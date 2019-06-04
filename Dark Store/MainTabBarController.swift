//  MainTabBarController.swift
//  Dark Store

//  Created by George Garcia on 6/2/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import UIKit

class MainTabBarController: UITabBarController { // UITabBarController -> Super Class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redViewController = UIViewController()
        redViewController.navigationItem.title = "Apps"
        redViewController.view.backgroundColor = .white
//        redViewController.tabBarItem.title = "RED"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        redNavController.tabBarItem.image = #imageLiteral(resourceName: "sheets")
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueViewController = UIViewController()
        blueViewController.navigationItem.title = "Search"
        blueViewController.view.backgroundColor = .white
//        blueViewController.tabBarItem.title = "BLUE"
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Search"
        blueNavController.tabBarItem.image = UIImage(named: "search")
        blueNavController.navigationBar.prefersLargeTitles = true
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        
        viewControllers = [ // creating viewcontrollers for 3 tabs
            redNavController,
            blueNavController,
            UIViewController()
        ]
    }
    
}

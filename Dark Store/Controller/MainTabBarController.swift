//  MainTabBarController.swift
//  Dark Store

//  Created by George Garcia on 6/2/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import UIKit

class MainTabBarController: UITabBarController { // UITabBarController -> Super Class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        
        viewControllers = [ // creating viewcontrollers for 3 tabs
            createNavController(viewController: AppsController(), title: "Apps", imageName: "sheets"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        
        viewController.view.backgroundColor   = .white
        viewController.navigationItem.title   = title
        
        return navigationController
    }
}



/*   MARK - NOTES
 
 1) Before Adding refactored code. This was in the viewDidLoad Method
 
 //        let todayController = UIViewController()
 //        todayController.navigationItem.title = "Today"
 //        todayController.view.backgroundColor = .white
 //
 //        let todayNavController = UINavigationController(rootViewController: todayController)
 //        todayNavController.tabBarItem.title = "Today"
 //        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today")
 //        todayNavController.navigationBar.prefersLargeTitles = true
 //
 //        let redViewController = UIViewController()
 //        redViewController.navigationItem.title = "Apps"
 //        redViewController.view.backgroundColor = .white
 //
 //        let redNavController = UINavigationController(rootViewController: redViewController)
 //        redNavController.tabBarItem.title = "Apps"
 //        redNavController.tabBarItem.image = #imageLiteral(resourceName: "sheets")
 //        redNavController.navigationBar.prefersLargeTitles = true
 //
 //        let blueViewController = UIViewController()
 //        blueViewController.navigationItem.title = "Search"
 //        blueViewController.view.backgroundColor = .white
 //
 //        let blueNavController = UINavigationController(rootViewController: blueViewController)
 //        blueNavController.tabBarItem.title = "Search"
 //        blueNavController.tabBarItem.image = UIImage(named: "search")
 //        blueNavController.navigationBar.prefersLargeTitles = true
 
 */

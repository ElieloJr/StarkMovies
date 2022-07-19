//
//  MainTabBarViewController.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = UINavigationController(rootViewController: HomeViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        
        home.tabBarItem.image = UIImage(systemName: "house")
        home.title = "Home"
        
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        search.title = "Search"
        
        tabBar.tintColor = .darkGray
        
        setViewControllers([home, search], animated: true)
    }
}

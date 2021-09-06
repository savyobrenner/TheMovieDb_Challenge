//
//  TabBarController.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfiguration()
        configureScreens()
    }
    
    private func initialConfiguration() {
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .darkGray
        DispatchQueue.main.async {
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    
    private func configureScreens() {
        let homeViewController = HomeScreenWireframe.configureModule()
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_home"), tag: 0)
        
        let favoritesViewController = FavoritesScreenWireframe.configureModule()
        favoritesViewController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_home"), tag: 0)
        
        let tabBarList = [homeViewController, favoritesViewController]
        viewControllers = tabBarList
    }
}


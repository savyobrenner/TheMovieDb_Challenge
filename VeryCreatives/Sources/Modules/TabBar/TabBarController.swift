//
//  TabBarController.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    private enum Strings {
        static let homeTitle = TabBarControllerStrings.homeTitle.localized()
        static let favoritesTitle = TabBarControllerStrings.favoritesTitle.localized()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfiguration()
        configureScreens()
    }
    
    private func initialConfiguration() {
        self.tabBar.tintColor = .colorBrand
        self.tabBar.barTintColor = .darkBrand
        DispatchQueue.main.async {
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    
    private func hasInternetConnection() -> Bool {
        return NetworkStatus.shared.isInternetAvailable()
    }
    
    private func configureScreens() {
        let homeViewController = HomeScreenWireframe.configureModule()
        homeViewController.tabBarItem = UITabBarItem(title: Strings.homeTitle, image: #imageLiteral(resourceName: "ic_home"), tag: 0)
        
        let favoritesViewController = FavoritesScreenWireframe.configureModule()
        favoritesViewController.tabBarItem = UITabBarItem(title: Strings.favoritesTitle, image: UIImage(systemName: "heart"), tag: 0)
        
        let tabBarList = hasInternetConnection()
            ? [homeViewController, favoritesViewController]
            : [favoritesViewController, homeViewController]
        
        viewControllers = tabBarList
    }
}


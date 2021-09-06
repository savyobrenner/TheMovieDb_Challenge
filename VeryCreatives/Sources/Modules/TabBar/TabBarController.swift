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
        let firstViewController = HomeScreenWireframe.configureModule()
        firstViewController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_home"), tag: 0)
        let tabBarList = [firstViewController]
        viewControllers = tabBarList
    }
}


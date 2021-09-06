//
//  SplashScreenInterfaces.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

enum SplashScreenNavigationOption { }

protocol SplashScreenWireframeInterface: WireframeInterface {
    func navigate(to option: SplashScreenNavigationOption)
}

protocol SplashScreenViewInterface: ViewInterface { }

protocol SplashScreenPresenterInterface: PresenterInterface {
    func startSplashAnimation(_ label: UILabel)
}

protocol SplashScreenInteractorProtocol: InteractorInterface { }

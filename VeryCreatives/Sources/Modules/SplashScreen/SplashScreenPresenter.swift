//
//  SplashScreenPresenter.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

final class SplashScreenPresenter {
    
    // MARK: - Private properties
    
    private weak var view: SplashScreenViewInterface?
    private let interactor: SplashScreenInteractorProtocol
    private let wireframe: SplashScreenWireframeInterface
        
    private enum Strings {
        static let title = ""
    }
    
    // MARK: - Lifecycle
    
    init(wireframe: SplashScreenWireframeInterface, view: SplashScreenViewInterface, interactor: SplashScreenInteractorProtocol) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - Extensions

extension SplashScreenPresenter: SplashScreenPresenterInterface { }
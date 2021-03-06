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
    
    private enum Constants {
        static let initialAlpha: CGFloat = 0.0
        static let finalAlpha: CGFloat = 1.0
        static let animationTimeInterval = 1.0
        static let delay = 0.5
    }
    
    // MARK: - Lifecycle
    init(wireframe: SplashScreenWireframeInterface, view: SplashScreenViewInterface, interactor: SplashScreenInteractorProtocol) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - Extensions
extension SplashScreenPresenter: SplashScreenPresenterInterface {
    func startSplashAnimation(_ label: UILabel) {
        label.alpha = Constants.initialAlpha
        UIView.animate(withDuration: Constants.animationTimeInterval, delay: Constants.delay, options: .curveEaseOut) {
            label.alpha = Constants.finalAlpha
        } completion: { _ in
            self.wireframe.navigate(to: .goToHomeScreen)
        }
    }
}

//
//  HomeScreenPresenter.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

final class HomeScreenPresenter {
    
    // MARK: - Private properties
    
    private weak var view: HomeScreenViewInterface?
    private let interactor: HomeScreenInteractorProtocol
    private let wireframe: HomeScreenWireframeInterface
        
    private enum Strings {
        static let staticName = "VeryCreatives!"
        static let subtitle = "Welcome to our movie app :)"
    }
    
    private enum Constants {
        static let welcomeSize: CGFloat = 24.0
        static let iconBordWidth: CGFloat = 1.0
    }
    
    // MARK: - Lifecycle
    
    init(wireframe: HomeScreenWireframeInterface, view: HomeScreenViewInterface, interactor: HomeScreenInteractorProtocol) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
    
    private func configureIcon(_ imageView: UIImageView) {
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = Constants.iconBordWidth
        imageView.circle()
    }
    
    private func configureWelcomeLabel(_ label: UILabel) {
        label.setBoldFontRange(changeText: Strings.staticName, size: Constants.welcomeSize)
    }
}

// MARK: - Presenter Extension
extension HomeScreenPresenter: HomeScreenPresenterInterface {
    func setupWelcomeHeader(_ title: UILabel, _ subtitle: UILabel, _ icon: UIImageView) {
        configureIcon(icon)
        configureWelcomeLabel(title)
        subtitle.text = Strings.subtitle
    }
}

// MARK: - Interactor Extension
extension HomeScreenPresenter: HomeScreenInteractorResponseProtocol {
    func responseGetPopularMoviesSuccess(movie: Movie?) {
        print(movie)
    }
    
    func responseGetPopularMoviesError() {
        print("Error")
    }
    
    func networkingNotAvailable() {
        print("Networking not available")
    }
    
}

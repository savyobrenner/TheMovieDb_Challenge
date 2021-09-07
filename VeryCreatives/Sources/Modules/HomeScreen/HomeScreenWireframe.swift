//
//  HomeScreenWireframe.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

final class HomeScreenWireframe: BaseWireframe {

  // MARK: - Module setup

  static func configureModule() -> UIViewController {
    
    // setup interactor
    let provider = HomeScreenProvider()
    let domain = HomeScreenDomain(provider: provider)
    let interactor = HomeScreenInteractor(domain: domain)
    
    domain.responsePopularMovies = interactor
    domain.respondeTopRatedMovies = interactor
    
    let viewController = HomeScreenViewController()
    let wireframe = HomeScreenWireframe(viewController: viewController)
    let presenter = HomeScreenPresenter(wireframe: wireframe, view: viewController, interactor: interactor)
    
    viewController.presenter = presenter
    interactor.delegate = presenter
    
    return viewController
  }
    
  // MARK: - Private Routing
    private func goToDetail(_ contentID: Int) {
        let viewController = MovieDetailsWireframe.configureModule(contentID: contentID)
        self.present(viewController, animated: true)
    }
}

// MARK: - Extensions

extension HomeScreenWireframe: HomeScreenWireframeInterface {
  func navigate(to option: HomeScreenNavigationOption) {
     switch option {
     case .goToDetail(let contentID):
       goToDetail(contentID)
     }
  }
}

//
//  MovieDetailsWireframe.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

final class MovieDetailsWireframe: BaseWireframe {

  // MARK: - Module setup

    static func configureModule(contentID: Int, favoriteData: Bool = false, favoriteMovie: FavoriteMovie? = nil) -> UIViewController {
    // setup interactor
    let provider = MovieDetailsProvider(contentID: contentID)
    let domain = MovieDetailsDomain(provider: provider)
    let interactor = MovieDetailsInteractor(domain: domain)
    
    domain.responseMovieDetails = interactor
    
    //setup presenter + viewcontroller
    let viewController = MovieDetailsViewController()
    let wireframe = MovieDetailsWireframe(viewController: viewController)
        let presenter = MovieDetailsPresenter(wireframe: wireframe, view: viewController, interactor: interactor, favoriteData: favoriteData, favoriteMovie: favoriteMovie)
    
    interactor.delegate = presenter
    viewController.presenter = presenter
    
    return viewController
  }
    
  // MARK: - Private Routing

}

// MARK: - Extensions

extension MovieDetailsWireframe: MovieDetailsWireframeInterface {
  func navigate(to option: MovieDetailsNavigationOption) {
    // switch option {
    // case <#pattern#>:
    //   <#code#>      
    // }
  }
}

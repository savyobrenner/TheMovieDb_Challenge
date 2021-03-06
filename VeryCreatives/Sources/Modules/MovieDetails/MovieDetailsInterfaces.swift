//
//  MovieDetailsInterfaces.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

enum MovieDetailsNavigationOption { }

protocol MovieDetailsWireframeInterface: WireframeInterface {
    func navigate(to option: MovieDetailsNavigationOption)
}

protocol MovieDetailsViewInterface: ViewInterface {
    func layoutIfNeeded()
    func showLoading(hide: Bool)
    func loadGenres(_ genres: [String])
    func loadInformations(movie: MovieDetails, isFavoriteMovie: Bool)
    func getVideoId(_ videoId: String)
    func loadLanguage(releaseDate: String, runtime: String, description: String, watchNow: String, warningExternalLinks: String, theMovieDbCredits: String, trailerMessage: String)
    func updateFavoriteButton(isFavorited: Bool)
}

protocol MovieDetailsPresenterInterface: PresenterInterface {
    func checkIfItsFavorited(_ button: UIButton)
    func getWatchNowLink() -> String
    func animateScreenWhenScrool(_ isScrolling: Bool, _ constraint: NSLayoutConstraint)
    func updateScrollViewHeight(_ label: UILabel, _ constraint: NSLayoutConstraint)
    func saveToFavorites()
}

protocol MovieDetailsInteractorProtocol: InteractorInterface {
    func getMovieDetails()
    func getMovieGenres()
    func getMovieVideos()
}

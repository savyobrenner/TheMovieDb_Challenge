//
//  HomeScreenInteractor.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//
//


import Foundation

/// Output methods
protocol HomeScreenInteractorResponseProtocol: AnyObject {
    func responseGetPopularMoviesSuccess(movie: Movie?)
    func responseError()
    func responseGetTopRatedMoviesSuccess(movie: Movie?)
    func networkingNotAvailable()
}

final class HomeScreenInteractor {
    
    private let domain: HomeScreenDomain
    weak var delegate: HomeScreenInteractorResponseProtocol?
    
    init(domain: HomeScreenDomain) {
      self.domain = domain
    }
    
}

// MARK: - Extensions

extension HomeScreenInteractor: HomeScreenInteractorProtocol {
    func getTopRatedMovies() {
        self.networking.check(.getTopRatedMovies)
    }
    
    func getPopularMovies() {
        self.networking.check(.getPopularMovies)
    }
}

extension HomeScreenInteractor: NetworkInteractorResponse {
    func networkingAvailable(_ ID: NetworkResponseType) {
        switch ID {
        case .getPopularMovies:
            domain.getPopularMovies()
        case .getTopRatedMovies:
            domain.getTopRatedMovies()
        default: break
        }
       
    }
    
    func networkingNotAvailable(_ ID: NetworkResponseType) {
        delegate?.networkingNotAvailable()
    }
}

extension HomeScreenInteractor: HomeScreenPopularMoviesResponseProtocol {
    
    func reponsePopularMoviesSuccess(data: Movie?) {
        if let data = data {
            delegate?.responseGetPopularMoviesSuccess(movie: data)
        } else {
            delegate?.responseError()
        }
    }
    
    func reponsePopularMoviesError(error: Error?) {
        delegate?.responseError()
    }
}

extension HomeScreenInteractor: HomeScreenTopRatedMoviesResponseProtocol {
    func reponseTopRatedMoviesSuccess(data: Movie?) {
        if let data = data {
            delegate?.responseGetTopRatedMoviesSuccess(movie: data)
        } else {
            delegate?.responseError()
        }
    }
    
    func reponseTopRatedMoviesError(error: Error?) {
        delegate?.responseError()
    }
}

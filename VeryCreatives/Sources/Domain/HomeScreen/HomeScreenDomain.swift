//
//  HomeScreenDomain.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import Foundation

/// Input methods
protocol HomeScreenDomainProtocol: AnyObject {
    func getPopularMovies()
}

/// Output methods
protocol HomeScreenPopularMoviesResponseProtocol: AnyObject {
    func reponsePopularMoviesSuccess(data: Movie?)
    func reponsePopularMoviesError(error: Error?)
}

final class HomeScreenDomain {
    
    // MARK: - Response Protocol
    weak var responsePopularMovies: HomeScreenPopularMoviesResponseProtocol?
    
    // MARK: - Provider
    var provider: HomeScreenProviderProtocol!
    
    // MARK: - Init
    init(provider: HomeScreenProviderProtocol) {
        self.provider = provider
    }
}

extension HomeScreenDomain: HomeScreenDomainProtocol {
    func getPopularMovies() {
        provider.getPopularMovies { (movie) in
            self.responsePopularMovies?.reponsePopularMoviesSuccess(data: movie)
        } failureCallback: { (error) in
            self.responsePopularMovies?.reponsePopularMoviesError(error: error)
        }
    }
}



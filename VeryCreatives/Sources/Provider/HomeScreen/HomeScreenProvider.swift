//
//  HomeScreenProvider.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import Foundation

protocol HomeScreenProviderProtocol {
    func getPopularMovies(successCallback: @escaping (Movie?) -> Void, failureCallback: @escaping (Error?) -> Void)
}

class HomeScreenProvider {
    
    //    private let popularMoviesRequest = PopularMoviesRequest()
    //    private let popularTvShowsRequest = PopularTvShowsRequest()
}

extension HomeScreenProvider: HomeScreenProviderProtocol {
    func getPopularMovies(successCallback: @escaping (Movie?) -> Void, failureCallback: @escaping (Error?) -> Void) {
        NetworkManager.shared.request(request: popularMoviesRequest) { (response: MovieResponse) in
            
            if let error = response.error {
                failureCallback(error)
                return
            }
            
            let data = response.movies
            successCallback(data)
        }
    }
}


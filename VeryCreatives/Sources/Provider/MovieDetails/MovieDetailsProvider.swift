//
//  MovieDetailsProvider.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

protocol MovieDetailsProviderProtocol {
    func getMovieDetails(successCallback: @escaping (MovieDetails?) -> Void, failureCallback: @escaping (Error?) -> Void)
    func getMoviesGenresList(successCallback: @escaping (GenresList?) -> Void, failureCallback: @escaping (Error?) -> Void)
    func getMovieVideos(successCallback: @escaping (MovieVideo?) -> Void, failureCallback: @escaping (Error?) -> Void)
}

class MovieDetailsProvider {
    
    private let movieDetailsRequest: MovieDetailsRequest
    private let movieVideosRequest: MovieVideosRequest
    private let movieGenresListRequest = MovieGenreListRequest()
    
    init(contentID: Int) {
        self.movieDetailsRequest = MovieDetailsRequest(contentID: contentID)
        self.movieVideosRequest = MovieVideosRequest(contentID: contentID)
    }
    
}

extension MovieDetailsProvider: MovieDetailsProviderProtocol {
    
    func getMovieVideos(successCallback: @escaping (MovieVideo?) -> Void, failureCallback: @escaping (Error?) -> Void) {
        NetworkManager.sharedInstance.request(request: movieVideosRequest) { (response: MovieVideosResponse) in
            if let error = response.error {
                failureCallback(error)
                return
            }
            
            let data = response.movieVideos
            successCallback(data)
        }
    }
    
    func getMoviesGenresList(successCallback: @escaping (GenresList?) -> Void, failureCallback: @escaping (Error?) -> Void) {
        NetworkManager.sharedInstance.request(request: movieGenresListRequest) { (response: GenreResponse) in
            
            if let error = response.error {
                failureCallback(error)
                return
            }
            
            let data = response.genre
            successCallback(data)
        }
    }
    
    func getMovieDetails(successCallback: @escaping (MovieDetails?) -> Void, failureCallback: @escaping (Error?) -> Void) {
        NetworkManager.sharedInstance.request(request: movieDetailsRequest) { (response: MovieDetailsResponse) in
            
            if let error = response.error {
                failureCallback(error)
                return
            }
            
            let data = response.movieDetails
            successCallback(data)
        }
        
    }
}


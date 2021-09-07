//
//  MovieDetailsDomain.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

/// Input methods
protocol MovieDetailsDomainProtocol: AnyObject {
    func getMovieDetails()
    func getMovieGenreList()
    func getMovieVideos()
}

/// Output methods
protocol MovieDetailsResponseProtocol: AnyObject {
    func responseMovieVideos(data: MovieVideo?)
    func responseMovieGenreList(data: GenresList?)
    func reponseMovieDetailsSuccess(data: MovieDetails?)
    func reponseMovieDetailsError(error: Error?)
}

final class MovieDetailsDomain {
    
    // MARK: - Response Protocol
    weak var responseMovieDetails: MovieDetailsResponseProtocol?
    
    // MARK: - Provider
    var provider: MovieDetailsProviderProtocol!
    
    // MARK: - Init
    init(provider: MovieDetailsProviderProtocol) {
        self.provider = provider
    }
}

extension MovieDetailsDomain: MovieDetailsDomainProtocol {
    func getMovieVideos() {
        provider.getMovieVideos { (movieVideos) in
            self.responseMovieDetails?.responseMovieVideos(data: movieVideos)
        } failureCallback: { (error) in
            self.responseMovieDetails?.reponseMovieDetailsError(error: error)
        }
    }
    
    func getMovieGenreList() {
        provider.getMoviesGenresList { (genreList) in
            self.responseMovieDetails?.responseMovieGenreList(data: genreList)
        } failureCallback: { (error) in
            self.responseMovieDetails?.reponseMovieDetailsError(error: error)
        }
    }
    
    func getMovieDetails() {
        provider.getMovieDetails { (MovieDetails) in
            self.responseMovieDetails?.reponseMovieDetailsSuccess(data: MovieDetails)
        } failureCallback: { (error) in
            self.responseMovieDetails?.reponseMovieDetailsError(error: error)
        }
    }
}



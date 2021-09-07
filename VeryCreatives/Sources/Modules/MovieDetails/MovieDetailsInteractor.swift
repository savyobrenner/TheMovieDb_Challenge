//
//  MovieDetailsInteractor.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//
//

import Foundation

/// Output methods
protocol MovieDetailsInteractorResponseProtocol: AnyObject {
    func responseGetMovieVideos(movieVideos: MovieVideo?)
    func responseGetMovieGenres(genres: GenresList?)
    func responseGetMovieDetailsSuccess(movie: MovieDetails?)
    func responseGetMovieDetailsError()
    func networkingNotAvailable()
}

final class MovieDetailsInteractor {
    private let domain: MovieDetailsDomain
    weak var delegate: MovieDetailsInteractorResponseProtocol?
    
    init(domain: MovieDetailsDomain) {
        self.domain = domain
    }
}

// MARK: - Extensions

extension MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    func getMovieVideos() {
        self.networking.check(.getMovieVideos)
    }
    
    func getMovieGenres() {
        self.networking.check(.getMovieGenreList)
    }
    
    func getMovieDetails() {
        self.networking.check(.getMovieDetails)
    }
}

extension MovieDetailsInteractor: NetworkInteractorResponse {
  func networkingAvailable(_ ID: NetworkResponseType) {
    switch ID {
    case .getMovieDetails:
        domain.getMovieDetails()
    case .getMovieGenreList:
        domain.getMovieGenreList()
    case .getMovieVideos:
        domain.getMovieVideos()
    default:
        break
    }
  }
  
  func networkingNotAvailable(_ ID: NetworkResponseType) {
    delegate?.networkingNotAvailable()
  }
}

extension MovieDetailsInteractor: MovieDetailsResponseProtocol {
    func responseMovieVideos(data: MovieVideo?) {
        if let data = data {
            delegate?.responseGetMovieVideos(movieVideos: data)
        } else {
            delegate?.responseGetMovieDetailsError()
        }
    }
    
    func responseMovieGenreList(data: GenresList?) {
        if let data = data {
            delegate?.responseGetMovieGenres(genres: data)
        } else {
            delegate?.responseGetMovieDetailsError()
        }
    }
    
    func reponseMovieDetailsSuccess(data: MovieDetails?) {
        if let data = data {
            delegate?.responseGetMovieDetailsSuccess(movie: data)
        } else {
            delegate?.responseGetMovieDetailsError()
        }
    }
    
    func reponseMovieDetailsError(error: Error?) {
        delegate?.responseGetMovieDetailsError()
    }
}
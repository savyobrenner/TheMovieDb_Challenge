//
//  FavoriteMovie.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

struct FavoriteMovie: Codable, Equatable {
    static func == (lhs: FavoriteMovie, rhs: FavoriteMovie) -> Bool {
        return lhs.movieDetails?.id == rhs.movieDetails?.id
    }
    
    let movieDetails: MovieDetails?
    let movieVideo: MovieVideo?
    let movieGenres: GenresList?
}

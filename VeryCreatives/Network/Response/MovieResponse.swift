//
//  MovieResponse.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import Foundation

class MovieResponse: ResponseHandler {
    var movies: Movie?
    
    override func parseModel() throws {
        if success() {
            guard let data = data else { return }
            movies = try JSONDecoder().decode(Movie.self, from: data)
        }
    }

}

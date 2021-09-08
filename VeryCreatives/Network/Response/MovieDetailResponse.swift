//
//  MovieDetailsResponse.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class MovieDetailsResponse: ResponseHandler {
    var movieDetails: MovieDetails?
    
    override func parseModel() throws {
        if success() {
            guard let data = data else { return }
            movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
        }
    }

}

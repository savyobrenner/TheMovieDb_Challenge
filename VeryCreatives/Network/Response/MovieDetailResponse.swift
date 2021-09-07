//
//  MovieDetailResponse.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class MovieDetailResponse: ResponseHandler {
    var movieDetail: MovieDetail?
    
    override func parseModel() throws {
        if success() {
            guard let data = data else { return }
            movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
        }
    }

}

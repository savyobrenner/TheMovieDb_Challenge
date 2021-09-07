//
//  MovieVideosResponse.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class MovieVideosResponse: ResponseHandler {
    var movieVideos: MovieVideo?
    
    override func parseModel() throws {
        if success() {
            guard let data = data else { return }
            movieVideos = try JSONDecoder().decode(MovieVideo.self, from: data)
        }
    }
}

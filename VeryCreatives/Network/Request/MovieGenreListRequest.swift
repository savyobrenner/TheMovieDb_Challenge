//
//  MovieGenreListRequest.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class MovieGenreListRequest: RequestHandler {
    func path() -> String {
        return EndPoint.getGenresMoviesList.fullPath
    }
    
    func httpMethod() -> RequestMethod {
        return .get
    }
}

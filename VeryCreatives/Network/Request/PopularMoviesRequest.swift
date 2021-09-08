//
//  PopularMoviesRequest.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import Foundation

class PopularMoviesRequest: RequestHandler {
    func path() -> String {
        return EndPoint.getPopularMovies.fullPath
    }
    
    func httpMethod() -> RequestMethod {
        return .get
    }
}

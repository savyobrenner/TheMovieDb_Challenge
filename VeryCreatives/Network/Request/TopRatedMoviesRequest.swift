//
//  TopRatedMoviesRequest.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class TopRatedMoviesRequest: RequestHandler {
    func path() -> String {
        return EndPoint.getTopRatedMovies.fullPath
    }
    
    func httpMethod() -> RequestMethod {
        return .get
    }
}

//
//  MovieDetailsRequest.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class MovieDetailsRequest: RequestHandler {
    
    let contentID: Int
    
    init(contentID: Int) {
        self.contentID = contentID
    }
    
    func path() -> String {
        return EndPoint.getMovieDetails(contentID: contentID).fullPath
    }
    
    func httpMethod() -> RequestMethod {
        return .get
    }
}

//
//  MovieVideosRequest.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class MovieVideosRequest: RequestHandler {
    
    let contentID: Int
    
    init(contentID: Int) {
        self.contentID = contentID
    }
    
    func path() -> String {
        return EndPoint.getMovieVideos(contentID: contentID).fullPath
    }
    
    func httpMethod() -> RequestMethod {
        return .get
    }
}

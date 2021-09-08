//
//  GenreResponse.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class GenreResponse: ResponseHandler {
    var genre: GenresList?
    
    override func parseModel() throws {
        if success() {
            guard let data = data else { return }
            genre = try JSONDecoder().decode(GenresList.self, from: data)
        }
    }

}

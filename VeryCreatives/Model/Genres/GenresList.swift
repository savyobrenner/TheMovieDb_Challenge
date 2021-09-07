//
//  GenresList.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

struct GenresList: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

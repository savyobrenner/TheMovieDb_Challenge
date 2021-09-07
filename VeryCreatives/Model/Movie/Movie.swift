//
//  Movie.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import Foundation

struct Movie: Codable {
    let results: [MovieResult]?
}

struct MovieResult: Codable {
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let backdropPath: String?
    let genreIDS: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}


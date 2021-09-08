//
//  MovieDetails.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

protocol MovieDetailsProtocol {
  func isEqualTo(_ other: MovieDetails) -> Bool
}

struct MovieDetails: Codable, Equatable {
    static func == (lhs: MovieDetails, rhs: MovieDetails) -> Bool {
        return lhs.id == rhs.id
    }

    let backdropPath: String?
    let genres: [Genre]?
    let id: Int?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres, id
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

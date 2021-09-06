//
//  APIConfig.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import Foundation
import Alamofire

enum BasePath {
    static let theMovieDBAPI = "http://api.themoviedb.org/3"
    static let getImagesTheMovieDBAPI = "https://image.tmdb.org/t/p/w500/"
    static let theMovieDBWebSite = "https://www.themoviedb.org"
}

enum EndPoint {
    case getPopularMovie
    case getPopularTVShows
    case getGenresMoviesList
    case getGenresTvShowsList
    case getMovieDetails(contentID: Int)
    case getMovieVideos(contentID: Int)
    case getMovieCredits(contentID: Int)
    case getMovieSimilars(contentID: Int)
    case getTvShowDetails(contentID: Int)
    case getTvShowVideos(contentID: Int)
    case getTvShowCredits(contentID: Int)
    case getTvShowSimilars(contentID: Int)
    case watchNowLink(contentID: Int)
}

enum Languages {
    case pt
    case en
    case es
    
    init (withId id: Int) {
        switch id {
        case 1: self = .pt
        case 2: self = .en
        case 3: self = .es
        default:
            self = .en
        }
    }
    
    var rawValue: String {
        switch self {
        case .pt: return "pt"
        case .en: return "en"
        case .es: return "es"
        }
    }
    
}

extension Languages {
    
    private var basePath: String { return "&language=" }
    
    func getLanguage() -> String {
        switch self {
        case .pt: return basePath + "pt-BR"
        case .en: return basePath + "en-US"
        case .es: return basePath + "es"
        }
    }
}

extension EndPoint {
    
    private var userLanguage: Int {
        guard let languagePrefix = Locale.preferredLanguages.first?.prefix(2) else { return 0 }
        switch languagePrefix {
        case Languages.pt.rawValue:
            return 1
        case Languages.en.rawValue:
            return 2
        case Languages.es.rawValue:
            return 3
        default:
            return 0
        }
    }
    
    private var languageId: Int { return userLanguage }
    
    private var baseURL: String { return BasePath.theMovieDBAPI }
    private var key: String { return "8d61230b01928fe55a53a48a41dc839b"}
    private var connective: String { return "?api_key="}
    private var language: String { return Languages.init(withId: languageId).getLanguage()}
    
    private var endPoint: String {
        switch self {
        case .getPopularMovie:
            return "/movie/popular"
        case .getPopularTVShows:
            return "/tv/popular"
        case .getGenresMoviesList:
            return "/genre/movie/list"
        case .getGenresTvShowsList:
            return "/genre/tv/list"
        case .getMovieDetails(let contentID):
            return "/movie/\(contentID)"
        case .getMovieVideos(let contentID):
            return "/movie/\(contentID)/videos"
        case .getMovieCredits(let contentID):
            return "/movie/\(contentID)/credits"
        case .getMovieSimilars(let contentID):
            return "/movie/\(contentID)/similar"
        case .watchNowLink(let contentID):
            return "/movie/\(contentID)"
        case .getTvShowDetails(let contentID):
            return "/tv/\(contentID)"
        case .getTvShowVideos(let contentID):
            return "/tv/\(contentID)/videos"
        case .getTvShowCredits(let contentID):
            return "/tv/\(contentID)/credits"
        case .getTvShowSimilars(let contentID):
            return "/tv/\(contentID)/similar"
        }
    }
    
    var fullPath: String {
        switch self {
        case .watchNowLink:
            let baseURL = BasePath.theMovieDBWebSite
            let connective = "/watch?locale="
            return baseURL + endPoint + connective + language
        default:
            return baseURL + endPoint + connective + key + language
        }
    }
}

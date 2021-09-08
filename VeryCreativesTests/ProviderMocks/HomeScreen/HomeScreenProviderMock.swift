//
//  HomeScreenProviderMock.swift
//  VeryCreativesTests
//
//  Created by Brenner on 07/09/21.
//

import Foundation

@testable import VeryCreatives

class HomeScreenProviderMock: HomeScreenProviderProtocol {
    
    private var mockTypeSuccess: MockEnumTypeSuccess?
    private var mockTypeError: MockEnumTypeError?
    
    private var statusCode: Int
    
    init(statusCode: Int, mockTypeSuccess: MockEnumTypeSuccess?, mockTypeError: MockEnumTypeError?) {
        self.statusCode = statusCode
        self.mockTypeSuccess = mockTypeSuccess
        self.mockTypeError = mockTypeError
    }
    
    func getPopularMovies(successCallback: @escaping (Movie?) -> Void, failureCallback: @escaping (Error?) -> Void) {
        let path = mockTypeError == nil ? mockTypeSuccess?.rawValue : mockTypeError?.rawValue
        let data = MockHelper.sharedInstance.mockRequest(path ?? "")
        let urlResponse = HTTPURLResponse(url: URL(string: "www.google.com.br")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
        let response = MovieResponse(with: data, urlResponse: urlResponse, error: nil)
        
        if let movies = response.movies {
            successCallback(movies)
        } else {
            let error = NSError(domain: "generic error", code: statusCode, userInfo: nil)
            failureCallback(error)
        }
    }
    
    func getTopRatedMovies(successCallback: @escaping (Movie?) -> Void, failureCallback: @escaping (Error?) -> Void) {
        let path = mockTypeError == nil ? mockTypeSuccess?.rawValue : mockTypeError?.rawValue
        let data = MockHelper.sharedInstance.mockRequest(path ?? "")
        let urlResponse = HTTPURLResponse(url: URL(string: "www.google.com.br")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
        let response = MovieResponse(with: data, urlResponse: urlResponse, error: nil)
        
        if let movies = response.movies {
            successCallback(movies)
        } else {
            let error = NSError(domain: "generic error", code: statusCode, userInfo: nil)
            failureCallback(error)
        }
    }
    
}

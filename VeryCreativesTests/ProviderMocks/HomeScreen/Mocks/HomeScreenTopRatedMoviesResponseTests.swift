//
//  HomeScreenTopRatedMoviesResponseTests.swift
//  VeryCreativesTests
//
//  Created by Brenner on 07/09/21.
//

import XCTest
@testable import VeryCreatives

class HomeScreenTopRatedMoviesResponseTests: BaseTestResponse<Movie, Error>, HomeScreenTopRatedMoviesResponseProtocol {
    func reponseTopRatedMoviesSuccess(data: Movie?) {
        guard let expectation = asyncExpectation else {
          XCTFail("Response was not setup correctly. Missing expectation reference.")
          return
        }
        
        asyncResultSuccess = data
        expectation.fulfill()
    }
    
    func reponseTopRatedMoviesError(error: Error?) {
        guard let expectation = asyncExpectation else {
          XCTFail("Response was not setup correctly. Missing expectation reference.")
          return
        }
        
        asyncResultError = error
        expectation.fulfill()
    }
}

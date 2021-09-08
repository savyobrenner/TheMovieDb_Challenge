//
//  HomeScreenTests.swift
//  VeryCreativesTests
//
//  Created by Brenner on 07/09/21.
//

import XCTest
@testable import VeryCreatives

class HomeScreenTests: XCTestCase {

    func configureHomeScreenDomainMock(statusCode: Int, mockSuccess: MockEnumTypeSuccess? = nil, mockError: MockEnumTypeError? = nil) -> HomeScreenDomain {
      let provider = HomeScreenProviderMock(statusCode: statusCode, mockTypeSuccess: mockSuccess, mockTypeError: mockError)
      let domain: HomeScreenDomain = HomeScreenDomain(provider: provider)
        
      return domain
    }
    
    func testGetPopularMoviesSuccess() {
        let response = HomeScreenPopularMoviesResponseTests()
        let domainMock = configureHomeScreenDomainMock(statusCode: 200, mockSuccess: .popularMoviesSuccess)
        response.asyncExpectation = expectation(description: "Config of expectation to waiting executing provider process.")
        domainMock.responsePopularMovies = response
        domainMock.getPopularMovies()
        
        waitForExpectations(timeout: 30.0, handler: { _ in
          if let error = response.asyncResultError {
            XCTFail("Failure return method conclusion(). \(error)")
            return
          }
            XCTAssertTrue(response.asyncResultSuccess?.results?.first?.id == 297761, "testGetPopularMoviesSuccess fail")
        })
    }
    
    func testGetPopularMoviesGenericError() {
        let response = HomeScreenPopularMoviesResponseTests()
        let domainMock = configureHomeScreenDomainMock(statusCode: 500, mockError: .genericError)
        response.asyncExpectation = expectation(description: "Config of expectation to waiting executing provider process.")
        domainMock.responsePopularMovies = response
        domainMock.getPopularMovies()
        
        waitForExpectations(timeout: 30.0, handler: { _ in
            XCTAssertNotNil(response.asyncResultError, "testGetPopularMoviesGenericError fail")
        })
    }
    
    func testGetTopRatedMoviesSuccess() {
        let response = HomeScreenTopRatedMoviesResponseTests()
        let domainMock = configureHomeScreenDomainMock(statusCode: 200, mockSuccess: .topRatedMoviesSuccess)
        response.asyncExpectation = expectation(description: "Config of expectation to waiting executing provider process.")
        domainMock.respondeTopRatedMovies = response
        domainMock.getTopRatedMovies()
        
        waitForExpectations(timeout: 30.0, handler: { _ in
          if let error = response.asyncResultError {
            XCTFail("Failure return method conclusion(). \(error)")
            return
          }
            XCTAssertTrue(response.asyncResultSuccess?.results?.first?.id == 278, "testGetPopularMoviesSuccess fail")
        })
    }
    
    func testGetTopRatedMoviesGenericError() {
        let response = HomeScreenTopRatedMoviesResponseTests()
        let domainMock = configureHomeScreenDomainMock(statusCode: 500, mockError: .genericError)
        response.asyncExpectation = expectation(description: "Config of expectation to waiting executing provider process.")
        domainMock.respondeTopRatedMovies = response
        domainMock.getTopRatedMovies()
        
        waitForExpectations(timeout: 30.0, handler: { _ in
            XCTAssertNotNil(response.asyncResultError, "testGetPopularMoviesGenericError fail")
        })
    }
}

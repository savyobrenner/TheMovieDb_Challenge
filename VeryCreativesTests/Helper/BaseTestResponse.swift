//
//  BaseTestResponse.swift
//  VeryCreativesTests
//
//  Created by Brenner on 08/09/21.
//

import XCTest

class BaseTestResponse<T: Decodable, E: Any> {
  var asyncResultSuccess: T?
  var asyncResultError: E?
  var asyncExpectation: XCTestExpectation?
}

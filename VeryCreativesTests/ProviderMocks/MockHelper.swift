//
//  MockHelper.swift
//  VeryCreativesTests
//
//  Created by Brenner on 07/09/21.
//

import Foundation

class MockHelper {
    
    static let sharedInstance = MockHelper()
    
    func mockRequest(_ path: String) -> Data? {
        if let path = Bundle(for: type(of: self)).path(forResource: path, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                return nil
            }
        }
        return nil
    }
}

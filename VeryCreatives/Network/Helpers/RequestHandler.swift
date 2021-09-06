//
//  RequestHandler.swift
//
//  Created by Brenner on 06/09/21.
//  Copyright © 2021 Brenner. All rights reserved.
//

import Foundation
import  Alamofire

protocol RequestHandler {
    func path() -> String
    func httpMethod() -> RequestMethod
    func headers() -> HTTPHeaders?
    func parameters() -> [String: Any]?
    func encoding() -> EncodingStrategy
}

extension RequestHandler {
    
    func path() -> String {
        preconditionFailure("This method must be overridden")
    }
    
    func httpMethod() -> RequestMethod {
        preconditionFailure("This method must be overridden")
    }
    
    func headers() -> HTTPHeaders? {
        return ["Content-Type": "application/json"]
    }
    
    func parameters() -> [String: Any]? {
        preconditionFailure("This method must be overridden")
    }
    
    func encoding() -> EncodingStrategy {
        return .JSON
    }
}

enum EncodingStrategy {
    case JSON
    case URL
}

extension EncodingStrategy {
    var alamofireEncoding: ParameterEncoding {
        switch self {
        case .JSON:  return JSONEncoding()
        case .URL: return URLEncoding(boolEncoding: .literal)
        }
    }
}

enum RequestMethod {
    case get
    case post
    case put
    case delete
}

extension RequestMethod {
    var alamofireMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
}

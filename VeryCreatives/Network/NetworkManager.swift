//  NetworkStatus.swift
//  Created by Brenner on 06/09/21.
//  Copyright © 2021 Brenner. All rights reserved.


import Foundation
import Alamofire

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    private lazy var manager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let manager = Alamofire.Session(configuration: configuration)
        return manager
    }()
    
    func request<T: RequestHandler, U: ResponseHandler>(request: T, completion: @escaping (U) -> Void) {
        
        manager.request(request.path(),
                        method: request.httpMethod().alamofireMethod,
                        parameters: request.parameters(),
                        encoding: request.encoding().alamofireEncoding,
                        headers: request.headers()).validate()
            .responseJSON { (json: AFDataResponse<Any>) in
                
                let urlResponse = json.response
                let responseObject: U = U(with: json.data, urlResponse: urlResponse, error: json.error)
                completion(responseObject)
            }
    }
}

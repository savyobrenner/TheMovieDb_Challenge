//
//  NetworkInteractor.swift

import Foundation

enum NetworkResponseType {
    case none
    case getPopularMovies
    case getTopRatedMovies
}

protocol NetworkInteractorProtocols {
    func check(_ ID: NetworkResponseType)
}

protocol NetworkInteractorResponse {
    func networkingAvailable(_ ID: NetworkResponseType)
    func networkingNotAvailable(_ ID: NetworkResponseType)
}

class NetworkInteractor {
    var response: NetworkInteractorResponse?
}

extension NetworkInteractor {
    
    func check(_ ID: NetworkResponseType = .none) {
        if NetworkStatus.shared.isInternetAvailable() {
            response?.networkingAvailable(ID)
        } else {
            response?.networkingNotAvailable(ID)
        }
    }
}

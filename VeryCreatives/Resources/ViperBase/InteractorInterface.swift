//
//  InteractorInterface.swift

import Foundation

protocol InteractorInterface: AnyObject {
    var networking: NetworkInteractor { get }
}

extension InteractorInterface {
    var networking: NetworkInteractor {
        let interactor = NetworkInteractor()
        interactor.response = self as? NetworkInteractorResponse
        return interactor
    }
}

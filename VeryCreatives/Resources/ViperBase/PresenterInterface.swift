//
//  BasePresenter.swift
//  MobileBanking
//
//  Created by Guilherme Coelho on 27/03/2018.
//  Copyright © 2018 BS2. All rights reserved.
//

import Foundation

protocol PresenterInterface: AnyObject {
    var network: NetworkInteractor { get }
    
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
}

extension PresenterInterface {
    
    var network: NetworkInteractor {
        let interactor = NetworkInteractor()
        interactor.response = self as? NetworkInteractorResponse
        return interactor
    }
    
    func viewDidLoad() {
        fatalError("Implementation pending...")
    }
    
    func viewWillAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewDidAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewWillDisappear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewDidDisappear(animated: Bool) {
        fatalError("Implementation pending...")
    }
}

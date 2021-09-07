//
//  MovieDetailPresenter.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

final class MovieDetailPresenter {
    
    // MARK: - Private properties
    
    private weak var view: MovieDetailViewInterface?
    private let interactor: MovieDetailInteractorProtocol
    private let wireframe: MovieDetailWireframeInterface
        
    private enum Strings {
        static let title = ""
    }
    
    private enum Constants {
        static let baseScrollViewHeight = 1000
        static let baseLabelLineHeight = 17
    }
    
    // MARK: - Lifecycle
    
    init(wireframe: MovieDetailWireframeInterface, view: MovieDetailViewInterface, interactor: MovieDetailInteractorProtocol) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        
    }
}

// MARK: - Extensions

extension MovieDetailPresenter: MovieDetailPresenterInterface {
    func updateScrollViewHeight(_ label: UILabel, _ constraint: NSLayoutConstraint) {
        let descriptionLabelSize = label.numberOfVisibleLines
        constraint.constant = CGFloat(Constants.baseScrollViewHeight + (descriptionLabelSize * Constants.baseLabelLineHeight))
    }
    
    func animateScreenWhenScrool(_ isScrolling: Bool, _ constraint: NSLayoutConstraint) {
        let constraintWhenIsScrolling: CGFloat = -100
        let constraintWhenIsNotScrolling: CGFloat = 0
        
        if isScrolling {
            constraint.constant = constraintWhenIsScrolling
        } else {
            constraint.constant = constraintWhenIsNotScrolling
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view?.layoutIfNeeded()
        }
    }
    
    func getWatchNowLink() -> String {
        return ""
    }
}

//
//  HomeScreenPresenter.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

final class HomeScreenPresenter {
    
    // MARK: - Private properties
    
    private weak var view: HomeScreenViewInterface?
    private let interactor: HomeScreenInteractorProtocol
    private let wireframe: HomeScreenWireframeInterface
        
    private enum Strings {
        static let staticName = "VeryCreatives!"
        static let subtitle = "Welcome to our movie app :)"
        static let cellIdentifier = "MovieCell"
    }
    
    private enum Constants {
        static let welcomeSize: CGFloat = 24.0
        static let iconBordWidth: CGFloat = 1.0
        static let staticHeight: CGFloat = 350.0
        static let widthCompensation: CGFloat = 20.0
        static let widthDivisionFactor: CGFloat = 2.0
        static let heightDivisionFactor:CGFloat = 3.0
    }
    
    private var movies: Movie? {
        didSet {
            view?.reloadData()
            view?.showLoading(hide: true)
        }
    }
    
    // MARK: - Lifecycle
    init(wireframe: HomeScreenWireframeInterface, view: HomeScreenViewInterface, interactor: HomeScreenInteractorProtocol) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.showLoading(hide: false)
        interactor.getPopularMovies()
    }
    
    private func configureIcon(_ imageView: UIImageView) {
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = Constants.iconBordWidth
        imageView.circle()
    }
    
    private func configureWelcomeLabel(_ label: UILabel) {
        label.setBoldFontRange(changeText: Strings.staticName, size: Constants.welcomeSize)
    }
}

// MARK: - Presenter Extension
extension HomeScreenPresenter: HomeScreenPresenterInterface {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Define cell width
        let screenWidth = UIScreen.main.bounds.width
        let widthDesired = CGFloat(screenWidth / Constants.widthDivisionFactor - Constants.widthCompensation)
        
        // Define cell height
        let screenHeight = UIScreen.main.bounds.height
        let heightDesired = CGFloat(screenHeight / Constants.heightDivisionFactor)
        
        return CGSize(width: widthDesired, height: heightDesired)
    }
    
    func configure(_ collectionView: UICollectionView) {
        let nib = UINib(nibName: Strings.cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Strings.cellIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // requires implementation
    }
    
    func numberOfItemsInSection(_ collectionView: UICollectionView, section: Int) -> Int {
        return movies?.results?.count ?? 0
    }
    
    func cellForItemAt(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.cellIdentifier, for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        let movie = self.movies?.results?[indexPath.row]
        cell.setup(movie: movie)
        
        return cell
    }
    
    func setupWelcomeHeader(_ title: UILabel, _ subtitle: UILabel, _ icon: UIImageView) {
        configureIcon(icon)
        configureWelcomeLabel(title)
        subtitle.text = Strings.subtitle
    }
}

// MARK: - Interactor Extension
extension HomeScreenPresenter: HomeScreenInteractorResponseProtocol {
    func responseGetPopularMoviesSuccess(movie: Movie?) {
        self.movies = movie
    }
    
    func responseGetPopularMoviesError() {
        //TODO
    }
    
    func networkingNotAvailable() {
        //TODO
    }
    
}

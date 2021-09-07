//
//  HomeScreenInterfaces.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//
//  This file was generated by the 💚 VIPER generator.
//

import UIKit

enum HomeScreenNavigationOption {
    case goToDetail(contentID: Int)
}

protocol HomeScreenWireframeInterface: WireframeInterface {
    func navigate(to option: HomeScreenNavigationOption)
}

protocol HomeScreenViewInterface: ViewInterface {
    func showLoading(hide: Bool)
    func reloadData()
}

protocol HomeScreenPresenterInterface: PresenterInterface {
    func setupWelcomeHeader(_ title: UILabel, _ subtitle: UILabel, _ icon: UIImageView)
    func configure(_ collectionView: UICollectionView)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    func numberOfItemsInSection(_ collectionView: UICollectionView, section: Int) -> Int
    func cellForItemAt(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize 
}

protocol HomeScreenInteractorProtocol: InteractorInterface {
    func getPopularMovies()
    func getTopRatedMovies()
}

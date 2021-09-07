//
//  LocalizableProjectStrings.swift
//  Created by Brenner on 06/09/21.
//  Copyright © 2021 Brenner. All rights reserved.
//

import Foundation

enum ErrorMessages: String, Localizable {
    case noConnection = "ErrorMessages_noConnection"
    case genericError = "ErrorMessages_genericError"
}

enum BaseViewControllerStrings: String, Localizable {
    case title = "BaseViewControllerStrings_title"
    case button = "BaseViewControllerStrings_btn"
}

enum TabBarControllerStrings: String, Localizable {
    case homeTitle = "TabBarControllerStrings_ homeTitle"
    case favoritesTitle = "TabBarControllerStrings_ favoritesTitle"
}

enum HomeScreenViewControllerStrings: String, Localizable {
    case headerSubtitle = "HomeScreenViewControllerStrings_headerSubtitle"
    case welcomeTitle = "HomeScreenViewControllerStrings_welcomeTitle"
    case popularMoviesTitle = "HomeScreenViewControllerStrings_popularMoviesTitle"
    case topRatedMoviesTitle = "HomeScreenViewControllerStrings_topRatedMoviesTitle"
}

enum MovieDetailsViewControllerStrings: String, Localizable {
    case releaseDateTitle = "MovieDetailsViewControllerStrings_releaseDateTitle"
    case runtimeTitle = "MovieDetailsViewControllerStrings_runtimeTitle"
    case descriptionTitleLable = "MovieDetailsViewControllerStrings_descriptionTitleLable"
    case watchNowButton = "MovieDetailsViewControllerStrings_watchNowButton"
    case warningRedirectExternalLink = "MovieDetailsViewControllerStrings_warningRedirectExternalLink"
    case theMovieDbCredits = "MovieDetailsViewControllerStrings_theMovieDbCredits"
}

enum FavoritesScreenViewControllerStrings: String, Localizable {
    case title = "FavoritesScreenViewControllerStrings_tile"
    case emptyStateText = "FavoritesScreenViewControllerStrings_emptyStateText"
}


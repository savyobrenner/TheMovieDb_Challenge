//
//  MovieCell.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: RoundImage!
    @IBOutlet var stars: [UIImageView]!
    @IBOutlet weak var movieTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        
    func setup(movie: MovieResult?) {
        guard let movie = movie else { return }
            let rate = movie.voteAverage?.rounded()
            coverImageView.setImage(path: movie.posterPath ?? "", isAPIImage: true)
            stars.updateStars(rate?.formatRating() ?? 0)
        movieTitle.text = movie.title
    }
    
    func setup(movie: MovieDetails?) {
        guard let movie = movie, let imageViewData = UserDefaults.standard.loadImage(movie.posterPath) else { return }
        let rate = movie.voteAverage?.rounded()
        coverImageView.image = UIImage(data: imageViewData)
        stars.updateStars(rate?.formatRating() ?? 0)
        movieTitle.text = movie.title
    }
}

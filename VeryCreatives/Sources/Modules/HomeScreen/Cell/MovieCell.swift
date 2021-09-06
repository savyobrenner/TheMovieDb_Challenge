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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        
    func setup(movie: MovieResult?) {
        guard let movie = movie else { return }
            let rate = movie.voteAverage?.rounded()
            coverImageView.setImage(path: movie.posterPath ?? "", isAPIImage: true)
            stars.updateStars(rate?.formatRating() ?? 0)
    }
}

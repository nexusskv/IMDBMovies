//
//  MovieCell+Setter.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MovieCell {
    
    /// ---> Function for add UI customizations <--- ///
    func setupUI() {
        roundCorners(7, border: 0.4, color: .lightGray)
        contentView.roundCorners(7, border: 0.4, color: .lightGray)
    }
    
    
    /// ---> Setter for values on UI <--- ///
    func setValues(_ object: MovieObject, index: Int) {
        posterImageView.setUrl(object.posterPath)

        posterImageView.roundCorners(15.0)
                
        titleLabel.text     = object.movieTitle
        
        if let date = object.releaseDate.formatDate() {
            dateLabel.text  = date
        }

        ratingView.setMaxRating(maxMovieRating)
        ratingView.setRating(Float(object.voteAvg))
        
        movieButton.tag = index
    }
}

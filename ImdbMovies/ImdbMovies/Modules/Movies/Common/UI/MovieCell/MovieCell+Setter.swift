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
    
    /// ---> Setter for values on UI <--- ///
    func setValues(_ object: MovieObject, index: Int) {
        let holderImage = UIImage(named: "cinema_holder")
        
        if !object.iconPath.isEmpty {
            let url = iconUrl + object.posterPath
            posterImageView.loadAsync(url, placeholder: holderImage)
        } else {
            posterImageView.image = holderImage
        }
        
        posterImageView.roundCorners(15.0)
                
        titleLabel.text     = object.movieTitle
        
        if let date = object.releaseDate.formatDate() {
            dateLabel.text  = date
        }

        ratingView.minAllowedRating = 1
        ratingView.maxAllowedRating = 10
        ratingView.setMaxRating(10)
        ratingView.setRating(Float(object.voteAvg))
    }
}

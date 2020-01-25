//
//  MovieCellViewModel.swift
//  ImdbMovies
//
//  Created by Rost on 25.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MovieCellViewModel {
    
    /// ---> Function for add UI customizations <--- ///
    func setupUI(_ cell: MovieCell) {
        cell.roundCorners(7, border: 0.4, color: .lightGray)
        cell.contentView.roundCorners(7, border: 0.4, color: .lightGray)
    }
    
    /// ---> Setter for values on UI <--- ///
       func setValues(_ cell: MovieCell, object: MovieObject, index: Int) {
           cell.posterImageView.setUrl(object.posterPath)

           cell.posterImageView.roundCorners(15.0)
                   
           cell.titleLabel.text     = object.movieTitle
           
           if let date = object.releaseDate.formatDate() {
               cell.dateLabel.text  = date
           }

           cell.ratingView.setMaxRating(maxMovieRating)
           cell.ratingView.setRating(Float(object.voteAvg))
           
           cell.movieButton.tag = index
       }
}

//
//  RatingCell.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class RatingCell: BaseTableCell {
    @IBOutlet weak var ratingView: StarsView!
    
    /// ---> Setter for values on UI <--- ///
    override func setDetailsValues(_ object: MovieDetailsObject) {
        ratingView.setMaxRating(maxMovieRating)
        ratingView.setRating(Float(object.voteAvg))
    }
}


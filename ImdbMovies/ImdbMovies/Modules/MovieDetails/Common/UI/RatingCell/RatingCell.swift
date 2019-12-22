//
//  RatingCell.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class RatingCell: BaseDetailsCell {
    @IBOutlet weak var ratingView: StarsView!
    @IBOutlet weak var budgetLabel: UILabel!
    
    /// ---> Setter for values on UI <--- ///
    override func setDetailsValues(_ object: MovieDetailsObject) {
        ratingView.setMaxRating(maxMovieRating)
        ratingView.setRating(Float(object.voteAvg))
        
        if object.budget > 0 {
            budgetLabel.text = "\(object.budget)" + " $"
        }
    }
}

